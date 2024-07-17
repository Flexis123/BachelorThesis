#include "Factories.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Analysis/InlineCost.h"
#include "Util.h"

static cl::opt<double_t> functionSizeLimit("size-increase-limit", cl::init(1.5));
static cl::opt<double_t> functionRpLimit("avgrp-limit", cl::init(6.0));

#define NEGATIVE_INLINE_COST_BONUS 10000


static BenefitCostInlineOrder* inlineOrder = nullptr;

bool notInModuleInlinerPass(InlineContext IC){
  return IC.Pass != InlinePass::ModuleInliner;
}

std::unique_ptr<InlineOrder<std::pair<CallBase *, int>>> 
        inlineOrderFactory(FunctionAnalysisManager &FAM, const InlineParams &Params, ModuleAnalysisManager &MAM, Module &M){
    
    std::unique_ptr<BenefitCostInlineOrder> ord(inlineOrder);
    return ord;
}

template <typename T, typename BT>
static InlineAdvisor* buildCostAdvisor(Module &M, FunctionAnalysisManager&FAM, InlineParams Params, InlineContext IC, Budget<T, BT>* budget){
  if(notInModuleInlinerPass(IC)) return new DisabledInlineAdvisor(M, FAM, IC);

  errs() << "loaded normal cost advisor\n";
  
  inlineOrder = new BenefitCostInlineOrder([budget](CallBase* CB){
    return -((double_t)budget->getInlineCost(CB));
  });
 
  return new BenefitCostInlineAdvisor(M, FAM, inlineOrder, {budget}, IC);
}

InlineAdvisor* sizeAdvisorFactory(Module &M, FunctionAnalysisManager &FAM, InlineParams Params, InlineContext IC){
  errs() << "loading size advisor\n";
  return buildCostAdvisor(M, FAM, Params, IC, new SizeCost(M, functionSizeLimit.getValue(), FAM));
}


InlineAdvisor* rpAdvisorFactory(Module &M, FunctionAnalysisManager &FAM, InlineParams Params, InlineContext IC){
  errs() << "loading rp advisor\n";
  return buildCostAdvisor(M, FAM, Params, IC, new RPCost(M, functionRpLimit.getValue(), FAM));
}


template <typename T, typename BT>
static double_t getBenefitCostRatio(CallBase* CB, FunctionAnalysisManager &FAM, Budget<T, BT>* budget){
  Module *M = CB->getCaller()->getParent();

  T inlineCost = budget->getInlineCost(CB);

  double_t benefit = getExecRatioGlobal(CB->getParent(), CB->getCaller(), FAM) * getCallsiteCost(*CB, DataLayout(M));
  if(inlineCost < 0) inlineCost = (-inlineCost) / 1000;
  return benefit / inlineCost;
}

template <typename T, typename BT>
static InlineAdvisor* buildBenefitCostAdvisor(Module &M, FunctionAnalysisManager&FAM, InlineParams Params, InlineContext IC, Budget<T, BT>* budget){
  if(notInModuleInlinerPass(IC)) return new DisabledInlineAdvisor(M, FAM, IC);

   errs() << "loaded normal benefit cost advisor\n";
  
  
  inlineOrder = new BenefitCostInlineOrder([budget, &FAM](CallBase* CB){
    return getBenefitCostRatio(CB, FAM, budget);
  });
 
  return new BenefitCostInlineAdvisor(M, FAM, inlineOrder, {budget}, IC);
}


InlineAdvisor* sizeCallSiteCostAdvisorFactory(Module &M, FunctionAnalysisManager &FAM, InlineParams Params, InlineContext IC){
  errs() << "loading value size advisor\n";
  return buildBenefitCostAdvisor(M, FAM, Params, IC, new SizeCost(M, functionSizeLimit.getValue(), FAM));
}

InlineAdvisor* rpCallSiteCostAdvisorFactory(Module &M, FunctionAnalysisManager &FAM, InlineParams Params, InlineContext IC){
  errs() << "loading value rp advisor\n";
  return buildBenefitCostAdvisor(M, FAM, Params, IC, new RPCost(M, functionRpLimit.getValue(), FAM));
}

InlineAdvisor* rpSizeCallSiteCostAdvisorFactory(Module &M, FunctionAnalysisManager &FAM, InlineParams Params, InlineContext IC){
  errs() << "loading value rp size advisor\n";
  if(notInModuleInlinerPass(IC)) return new DisabledInlineAdvisor(M, FAM, IC);
  errs() << "loaded value rp size advisor\n";
  
  SizeCost* sc = new SizeCost(M, functionSizeLimit.getValue(), FAM);
  RPCost* rc = new RPCost(M, functionRpLimit.getValue(), FAM);

  inlineOrder = new BenefitCostInlineOrder([sc, rc, &FAM](CallBase* CB){
    Module *M = CB->getCaller()->getParent();

    double_t inlineCostRp = rc->getInlineCost(CB);
    if(inlineCostRp < 0.0) inlineCostRp = (-inlineCostRp) / 1000;

    double_t benefit = getExecRatioGlobal(CB->getParent(), CB->getCaller(), FAM) * getCallsiteCost(*CB, DataLayout(M));
    return benefit / (sc->getInlineCost(CB) * inlineCostRp);
  });
 
  return new BenefitCostInlineAdvisor(M, FAM, inlineOrder, {sc, rc}, IC);
}