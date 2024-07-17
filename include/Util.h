#ifndef UTIL_THESIS_H
#define UTIL_THESIS_H

#include "llvm/IR/Function.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/PassManager.h"
#include "llvm/IR/InstrTypes.h"
#include <math.h>

using namespace llvm;

double_t getExecRatioGlobal(const BasicBlock *BB, Function *F, FunctionAnalysisManager &FAM);
bool isInlinable(CallBase* C, FunctionAnalysisManager &FAM);
bool isInlinable(Function* F, FunctionAnalysisManager &FAM);


#endif