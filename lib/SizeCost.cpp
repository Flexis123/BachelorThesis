#include "Metrics.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/Analysis/TargetTransformInfo.h"
#include "llvm/Support/raw_ostream.h"
#include "Util.h"

uint32_t SizeCost::getBudgetValFor(Function *F){
    auto it = functionSizes.find(F);
    if(it != functionSizes.end()){
        return (*it).second;
    }

    assert(F);
    TargetTransformInfo &tti = FAM.getResult<TargetIRAnalysis>(*F);

    InstructionCost cost = 0;
    DataLayout dl(F->getParent());

    for(BasicBlock &BB: *F){
        for(Instruction &I: BB){
            cost += tti.getInstructionCost(&I, TargetTransformInfo::TargetCostKind::TCK_CodeSize);
        }
    }

    uint32_t ret = cost.getValue().value_or(0);
    functionSizes.insert({F, ret});
    return ret;
}

void SizeCost::initBudget(Module &M){
    budget = 0;
    for(Function &F: M) {
        if(isInlinable(&F, FAM)) budget += getBudgetValFor(&F);
    }
    budgetLimit = budget + budget * sizeIncrease;
}

uint32_t SizeCost::getInlineCost(CallBase* CB){
    return getBudgetValFor(CB->getCalledFunction());
}

uint32_t SizeCost::updateCallerSize(Function* CalledFN, Function* Caller){
    uint32_t sizeIncrease = getBudgetValFor(CalledFN);
    functionSizes[Caller] += sizeIncrease;
    return sizeIncrease;
}

void SizeCost::onInline(Function* CalledFN, Function* Caller, const BasicBlock* CBParent, CallBase* CB, SmallVector<CallBase*, 16> &inlinedCalls){   
    budget += updateCallerSize(CalledFN, Caller);
}

void SizeCost::onInlineWithCalleeDeleted(Function* CalledFN, Function* Caller, const BasicBlock* CBParent, CallBase* CB, SmallVector<CallBase*, 16> &inlinedCalls) {
    updateCallerSize(CalledFN, Caller);
}

void SizeCost::onUnsuccessfulInline(Function* CalledFN, Function* Caller, CallBase* CB) {}
void SizeCost::onUnattemptedInlining(Function* CalledFN, Function* Caller, CallBase* CB) {}
