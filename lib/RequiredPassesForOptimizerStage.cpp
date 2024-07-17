#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Transforms/Utils/Mem2Reg.h"
#include "llvm/Transforms/Scalar/ADCE.h"
#include "llvm/Transforms/Utils/UnifyFunctionExitNodes.h"

using namespace llvm;

extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo
llvmGetPassPluginInfo() {
	return {LLVM_PLUGIN_API_VERSION, "RequiredPassesForOptimizerStage",
	LLVM_VERSION_STRING,
			[](PassBuilder &PB) {
                PB.registerPipelineStartEPCallback([&](llvm::ModulePassManager &MPM, llvm::OptimizationLevel){ // mem2reg
					MPM.addPass(createModuleToFunctionPassAdaptor(UnifyFunctionExitNodesPass()));
                });
			}};
}