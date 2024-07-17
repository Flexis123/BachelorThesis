#ifndef DEFAULT_DYNAMIC_ADVISOR_H
#define DEFAULT_DYNAMIC_ADVISOR_H

#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

struct DefaultDynamicAdvisor : PassInfoMixin<DefaultDynamicAdvisor> {
	PreservedAnalyses run(Module &, ModuleAnalysisManager &MAM);
};

#endif