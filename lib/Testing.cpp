#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/Support/type_traits.h"
#include "llvm/ADT/SmallPtrSet.h"
#include <cstdlib>

using namespace llvm;



struct Test : PassInfoMixin<Test> {
    PreservedAnalyses run(Module &M, ModuleAnalysisManager&) {
        
        return PreservedAnalyses::all();
    }
};


extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo
llvmGetPassPluginInfo() {
return {LLVM_PLUGIN_API_VERSION, "Test",
LLVM_VERSION_STRING,
        [](PassBuilder &PB) {
            PB.registerPipelineParsingCallback(
            [&](StringRef Name, ModulePassManager &PM,
                ArrayRef<PassBuilder::PipelineElement>) {
                if (Name == "test") {
                    PM.addPass(Test());
                    return true;
                }
                return false;
            });
        }};
}