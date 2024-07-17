#include "Metrics.h"
#include "llvm/IR/CFG.h"
#include "llvm/ADT/SmallPtrSet.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Support/Casting.h"
#include "llvm/Analysis/BlockFrequencyInfo.h"
#include "llvm/Analysis/ProfileSummaryInfo.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/Analysis/TargetTransformInfo.h"
#include "llvm/Analysis/TargetLibraryInfo.h"
#include "llvm/ADT/SetOperations.h"
#include "Util.h"

#define RP_META_NAME "rp"

static void setRpMeta(CallBase* CB, uint16_t val){
    Metadata *IntMeta = ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(CB->getContext()), val));
    MDNode *Node = MDNode::get(CB->getContext(), IntMeta);
    CB->setMetadata(RP_META_NAME, Node);
}

static uint16_t getRpMeta(CallBase* CB){
   
    if(!CB->getMetadata(RP_META_NAME)){
        return 0;
    }
    return cast<ConstantInt>(
            cast<ConstantAsMetadata>(CB->getMetadata(RP_META_NAME)->getOperand(0))->getValue()
    )->getValue().getZExtValue();
}


class BBLivenessInfo{
    public:
        DenseSet<Value*> liveIn;
        DenseSet<Value*> liveOut;
        DenseSet<Value*> phiUses;

        BBLivenessInfo(DenseSet<Value*> _liveIn, DenseSet<Value*> _liveOut,  DenseSet<Value*> _phiUses) 
            : liveIn(_liveIn), liveOut(_liveOut), phiUses(_phiUses) {}

        BBLivenessInfo() {}
            
};


//TODO if we have time use the stack version!
void up_and_mark(BasicBlock *BB, Value *v, BasicBlock *vBBDef, DenseMap<BasicBlock*, BBLivenessInfo> &bbLivenessInfo){
    for(PHINode &phi: BB->phis()){
        for(Use &U: phi.operands()){
            if(v == U.get()) return;
        }
    }

    BBLivenessInfo &bbL = bbLivenessInfo[BB];
    if((vBBDef == BB && !dyn_cast<PHINode>(v)) || bbL.liveIn.contains(v)) return;

    bbL.liveIn.insert(v);

    if(vBBDef == BB && dyn_cast<PHINode>(v)) return;
    
    for(BasicBlock* BBP : predecessors(BB)){
        BBLivenessInfo &bbPL = bbLivenessInfo[BBP];
        bbPL.liveOut.insert(v);
        up_and_mark(BBP, v, vBBDef, bbLivenessInfo);
    }
}

void liveness(Value *v, BasicBlock *vBBDef, DenseMap<BasicBlock*, BBLivenessInfo> &bbLivenessInfo){
    SmallPtrSet<BasicBlock*, 8> vbbs;
    for(User *U : v->users()){
        if (Instruction* Inst = dyn_cast<Instruction>(U)) {
            vbbs.insert(Inst->getParent());
        }
    }
    vbbs.insert(vBBDef);

    for(BasicBlock* vbb: vbbs){//for each block B where v is used
        BBLivenessInfo &vbbL = bbLivenessInfo[vbb];

        if(vbbL.phiUses.contains(v)){
            vbbL.liveOut.insert(v);
        }
        vbb->phis();
        
        up_and_mark(vbb, v, vBBDef, bbLivenessInfo);
    }
}


std::pair<double_t, double_t>& RPCost::computeFunctionRpSumAndWeightSum(Function *FF){
    auto it = functionRPs.find(FF);
    if(it != functionRPs.end()) return it->getSecond();

    Function &F = *FF;

    DenseMap<BasicBlock*, BBLivenessInfo> bbLivenessInfo;
    for(BasicBlock &B: F){
        BasicBlock *BB = &B;

        DenseSet<Value*> phiUsesBB;
        for(BasicBlock* b : successors(BB)){
            for (PHINode &phi: b->phis()){
                for(Use &U: phi.operands()){
                    Value* v = U.get();
                    if(dyn_cast<Instruction>(v) || dyn_cast<Argument>(v)){
                        phiUsesBB.insert(v);
                    }
                }
            }
        }

        bbLivenessInfo.insert({BB, BBLivenessInfo({}, {}, phiUsesBB)});
    }

    for(Argument &arg : F.args()){
        liveness(&arg, &F.getEntryBlock(), bbLivenessInfo);
    }
    
    for(BasicBlock &BB: F){
        for(Instruction &I : BB){
            liveness(&I, I.getParent(), bbLivenessInfo);      
        }
    }


    //do instrucion level liveness
    //record average register pressure for each block and record rp for each call site
    // RP at an instruction == liveOut[instruction]

    
    double_t FRPSum = 0.0;
    double_t FWeightSum = 0.0;
    for(BasicBlock &B: F){
        BBLivenessInfo &bbl = bbLivenessInfo[&B];
       
        double_t BBrpSum = 0.0;
        DenseSet<Value*> currLiveOut = bbl.liveOut;
        
        for(Instruction &I: reverse(B)){
            if(dyn_cast<ReturnInst>(&I) || dyn_cast<UnreachableInst>(&I)) continue;

            CallBase* C;
            if((C = dyn_cast<CallBase>(&I)) && isInlinable(C, FAM)){
                DenseSet<Value*> ret_val({C});
                uint16_t CBrp = set_difference(currLiveOut, ret_val).size();
                setRpMeta(C, CBrp);
                callSiteRps.insert({C, CBrp});
            }

            BBrpSum += currLiveOut.size();

            currLiveOut.erase(&I);
            for(Use &U: I.operands()){
                Value* use = U.get();
                if(dyn_cast<Instruction>(use) || dyn_cast<Argument>(use)) currLiveOut.insert(use);
            }
        }

        double_t weight = getExecRatioGlobal(&B, FF, FAM);
        FWeightSum += B.size() * weight;
        BBrpSum *= weight;
        FRPSum += BBrpSum;
    }

    functionRPs.insert({FF, {FRPSum, FWeightSum}});
    return functionRPs[FF];
}

double_t RPCost::getBudgetValFor(Function *F){
    std::pair<double_t, double_t> rpAndWeightSum = computeFunctionRpSumAndWeightSum(F);
    return rpAndWeightSum.first / rpAndWeightSum.second;
}

void RPCost::initBudget(Module &M){
    globalRp = std::make_pair<double_t, double_t>(0.0, 0.0);
    for(Function &F: M){
        if(isInlinable(&F, FAM)){
            std::pair<double_t, double_t> &fb = computeFunctionRpSumAndWeightSum(&F);
            globalRp.first += fb.first;
            globalRp.second += fb.second;
        }
    }
    budget = globalRp.first / globalRp.second;
}

std::pair<double_t, double_t> RPCost::getInlineCostSumWeight(Function* caller, Function *calledFn, const BasicBlock *callBB, uint16_t CBrp){
    std::pair<double_t, double_t> &calledFNRp = computeFunctionRpSumAndWeightSum(calledFn);

    return std::make_pair<double_t, double_t>(
        calledFNRp.first + (((double_t)CBrp) * calledFNRp.second),
        calledFNRp.second + 0.0 //rvalue bullcrap fuck this language i hate it
    );
}

std::pair<double_t, double_t> RPCost::getInlineCostSumWeight(CallBase* CB, uint16_t CBrp){
    return getInlineCostSumWeight(CB->getCaller(), CB->getCalledFunction(), CB->getParent(), CBrp);
}

double_t RPCost::getInlineCost(CallBase* CB){
    std::pair<double_t, double_t> inlineCost = getInlineCostSumWeight(CB, getRpMeta(CB));
    
    double_t globalRpNewSum = globalRp.first + inlineCost.first;
    double_t globalRpNewWeightSum = globalRp.second + inlineCost.second;

    return (globalRpNewSum / globalRpNewWeightSum) - budget;
}


std::pair<double_t, double_t> RPCost::updateCallerAndCallSitesRp(Function* CalledFN, Function* Caller, const BasicBlock* CBParent, CallBase* CB, SmallVector<CallBase*, 16> &inlinedCalls){
    std::pair<double_t, double_t> &callerRp = computeFunctionRpSumAndWeightSum(Caller);
    uint16_t CBrp = callSiteRps[CB];

    std::pair<double_t, double_t> inlineCost = getInlineCostSumWeight(Caller, CalledFN, CBParent, CBrp);

    callerRp.first += inlineCost.first;
    callerRp.second += inlineCost.second;

    for(CallBase *ICB: inlinedCalls){
        uint16_t newICBrp = CBrp + getRpMeta(ICB);
        callSiteRps.insert({ICB, newICBrp});
        setRpMeta(ICB, newICBrp);
    }
    callSiteRps.erase(CB);

    return inlineCost;
}

void RPCost::onInline(Function* CalledFN, Function* Caller, const BasicBlock* CBParent, CallBase* CB, SmallVector<CallBase*, 16> &inlinedCalls){
    std::pair<double_t, double_t> inlineCost = updateCallerAndCallSitesRp(CalledFN, Caller, CBParent, CB, inlinedCalls);

    globalRp.first += inlineCost.first;
    globalRp.second += inlineCost.second;

    budget = globalRp.first / globalRp.second;
}

void RPCost::onInlineWithCalleeDeleted(Function* CalledFN, Function* Caller, const BasicBlock* CBParent, CallBase* CB, SmallVector<CallBase*, 16> &inlinedCalls) {
    updateCallerAndCallSitesRp(CalledFN, Caller, CBParent, CB, inlinedCalls);
    functionRPs.erase(CalledFN);
}

void RPCost::onUnsuccessfulInline(Function* CalledFN, Function* Caller, CallBase* CB) {
    
}

void RPCost::onUnattemptedInlining(Function* CalledFN, Function* Caller, CallBase* CB) {
}


