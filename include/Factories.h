#ifndef FACTORIES_H
#define FACTORIES_H

#include "BenefitCostInlineAdvisor.h"
#include "BenefitCostInlineOrder.h"
#include "Metrics.h"

bool notInModuleInlinerPass(InlineContext IC);

std::unique_ptr<InlineOrder<std::pair<CallBase *, int>>> 
        inlineOrderFactory(FunctionAnalysisManager &FAM, const InlineParams &Params, ModuleAnalysisManager &MAM, Module &M);


InlineAdvisor* sizeAdvisorFactory(Module &M, FunctionAnalysisManager&FAM, InlineParams Params, InlineContext IC);
InlineAdvisor* rpAdvisorFactory(Module &M, FunctionAnalysisManager&FAM, InlineParams Params, InlineContext IC);
InlineAdvisor* sizeCallSiteCostAdvisorFactory(Module &M, FunctionAnalysisManager&FAM, InlineParams Params, InlineContext IC);
InlineAdvisor* rpCallSiteCostAdvisorFactory(Module &M, FunctionAnalysisManager &FAM, InlineParams Params, InlineContext IC);
InlineAdvisor* rpSizeCallSiteCostAdvisorFactory(Module &M, FunctionAnalysisManager &FAM, InlineParams Params, InlineContext IC);



#endif


