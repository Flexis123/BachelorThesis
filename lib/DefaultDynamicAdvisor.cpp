#include "DefaultDynamicAdvisor.h"
#include "Metrics.h"
#include "BenefitCostInlineOrder.h"
#include "Factories.h"
#include "TestModuleInliner.h"
#include "llvm/Transforms/IPO/ModuleInliner.h"

using namespace llvm;

enum AdvisorType{
	ADVISOR_SIZE, ADVISOR_RP, ADVISOR_VALUE_SIZE, ADVISOR_VALUE_RP, ADVISOR_VALUE_RP_SIZE
};

static cl::opt<AdvisorType> advisor("advisor",  cl::values(
	clEnumVal(ADVISOR_SIZE, "advisor which uses size of functions only to make decisions"),
	clEnumVal(ADVISOR_RP, "advisor which uses average rp of functions only to make decisions"),
	clEnumVal(ADVISOR_VALUE_SIZE, "advisor which uses value/size ratio  to make decisions"),
	clEnumVal(ADVISOR_VALUE_RP, "advisor which uses value/avg_rp ratio  to make decisions"),
	clEnumVal(ADVISOR_VALUE_RP_SIZE, "advisor which uses value/ avg_rp * size ratio  to make decisions")
), cl::init(ADVISOR_SIZE));



PreservedAnalyses DefaultDynamicAdvisor::run(Module &, ModuleAnalysisManager &MAM) {

	PluginInlineAdvisorAnalysis::AdvisorFactory advisorFactory;

	switch (advisor.getValue())
	{
	case ADVISOR_SIZE:
		advisorFactory = sizeAdvisorFactory;
		break;

	case ADVISOR_RP:
		advisorFactory = rpAdvisorFactory;
		break;

	case ADVISOR_VALUE_SIZE:
		advisorFactory = sizeCallSiteCostAdvisorFactory;
		break;

	case ADVISOR_VALUE_RP:
		advisorFactory = rpCallSiteCostAdvisorFactory;
		break;

	case ADVISOR_VALUE_RP_SIZE:
		advisorFactory = rpSizeCallSiteCostAdvisorFactory;
		break;
	
	default:
		break;
	}

	MAM.registerPass([&] { 
		return PluginInlineAdvisorAnalysis(advisorFactory); 
	});
	MAM.registerPass([&] { return PluginInlineOrderAnalysis(inlineOrderFactory); });
	

	return PreservedAnalyses::all();
}



extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo
llvmGetPassPluginInfo() {
	return {LLVM_PLUGIN_API_VERSION, "DefaultDynamicAdvisor",
	LLVM_VERSION_STRING,
			[](PassBuilder &PB) {
				PB.registerFullLinkTimeOptimizationEarlyEPCallback([&](ModulePassManager &MPM, OptimizationLevel O){
					MPM.addPass(DefaultDynamicAdvisor());
				});
			}};
}