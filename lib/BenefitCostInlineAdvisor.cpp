#include "BenefitCostInlineAdvisor.h"

std::unique_ptr<InlineAdvice> BenefitCostInlineAdvisor::getAdviceImpl(CallBase &CB){
    for(BudgetBase* budget: budgets){
        if(!budget->canInline(&CB)){
            return std::make_unique<BenefitCostInlineAdvice>(this, CB, getCallerORE(CB), false);
        }
    }
    return std::make_unique<BenefitCostInlineAdvice>(this, CB, getCallerORE(CB), true);
}

void BenefitCostInlineAdvisor::onPassEntry(LazyCallGraph::SCC *SCC){
    
}

void BenefitCostInlineAdvisor::onPassExit(LazyCallGraph::SCC *SCC = nullptr) {
    for(BudgetBase* budget: budgets) delete budget;
}


void BenefitCostInlineAdvice::doForBudgetBase(std::function<void(BudgetBase*)> action){
    for(BudgetBase *budget : bcAdvisor->getBudgets()) action(budget); 
}

void BenefitCostInlineAdvice::doOnInline(std::function<void(BudgetBase*, BenefitCostInlineOrder*)> action){
    BenefitCostInlineOrder *ord = bcAdvisor->getInlineOrder();
    doForBudgetBase([&] (BudgetBase* iu){action(iu, ord);});
    ord->getInlinedCalls().clear();
}

void BenefitCostInlineAdvice::recordInliningImpl(){
    doOnInline([&] (BudgetBase* iu, BenefitCostInlineOrder *ord){
        iu->onInline(Callee, Caller, Block, CB, ord->getInlinedCalls());
    });
}

void BenefitCostInlineAdvice::recordInliningWithCalleeDeletedImpl(){
    doOnInline([&] (BudgetBase* iu, BenefitCostInlineOrder *ord){
        iu->onInlineWithCalleeDeleted(Callee, Caller, Block, CB, ord->getInlinedCalls());
    });
}
// notify cost classes sothey delete the functions and calls

void BenefitCostInlineAdvice::recordUnsuccessfulInliningImpl(const InlineResult &Result) {
    doForBudgetBase([&] (BudgetBase* iu){
        iu->onUnsuccessfulInline(Callee, Caller, CB);
    });
} 

void BenefitCostInlineAdvice::recordUnattemptedInliningImpl() {
    doForBudgetBase([&] (BudgetBase* iu){
        iu->onUnattemptedInlining(Callee, Caller, CB);
    });
}