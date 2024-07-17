#include "Util.h"
#include "llvm/Analysis/BlockFrequencyInfo.h"
#include "llvm/Analysis/ProfileSummaryInfo.h"
#include "llvm/Analysis/TargetLibraryInfo.h"

double_t getExecRatioGlobal(const BasicBlock *BB, Function *F, FunctionAnalysisManager &FAM){
    BlockFrequencyInfo &BFI = FAM.getResult<BlockFrequencyAnalysis>(*F);
    ProfileSummary *ps = ProfileSummary::getFromMD(F->getParent()->getProfileSummary(false));

    double_t res;
    if(ps) res = (BFI.getBlockProfileCount(BB).value_or(0.0) + 1.0) / (ps->getMaxCount() + 1.0); 
    else res = 1.0;

    return res;
}

static bool isKnownLibFunction(Function &F, TargetLibraryInfo &TLI) {
  LibFunc LF;

  return TLI.getLibFunc(F, LF) ||
         TLI.isKnownVectorFunctionInLibrary(F.getName());
}

bool isInlinable(CallBase* C, FunctionAnalysisManager &FAM){
    if(Function* Callee = C->getCalledFunction()) return isInlinable(Callee, FAM);
    return false;
}

bool isInlinable(Function* F, FunctionAnalysisManager &FAM){
    TargetLibraryInfo &tli = FAM.getResult<TargetLibraryAnalysis>(*F);
    return !F->isDeclaration() && !isKnownLibFunction(*F, tli);
}