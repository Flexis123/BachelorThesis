#ifndef  BENEFIT_COST_INLINE_ADVSIOR_H
#define  BENEFIT_COST_INLINE_ADVSIOR_H

#include "llvm/Analysis/InlineAdvisor.h"
#include "BenefitCostInlineOrder.h"
#include "Metrics.h"

using namespace llvm;

class DisabledInlineAdvice : public InlineAdvice{
    public:
        DisabledInlineAdvice(InlineAdvisor *Advisor, CallBase &CB,
               OptimizationRemarkEmitter &ORE, bool IsInliningRecommended) : InlineAdvice(Advisor, CB, ORE, IsInliningRecommended) {}
};

class DisabledInlineAdvisor : public InlineAdvisor{
    public:
        DisabledInlineAdvisor(Module &M, FunctionAnalysisManager &FAM, std::optional<InlineContext> IC = std::nullopt) : InlineAdvisor(M, FAM, IC) { }
    protected:
        std::unique_ptr<InlineAdvice> getAdviceImpl(CallBase &CB){
            return std::make_unique<DisabledInlineAdvice>(this, CB, getCallerORE(CB), false);
        }

};

class BenefitCostInlineAdvisor : public InlineAdvisor{

public:
    void onPassEntry(LazyCallGraph::SCC *SCC) override;
    void onPassExit(LazyCallGraph::SCC *SCC) override;

    inline BenefitCostInlineOrder *getInlineOrder() {return inlineOrder;}
    inline SmallVector<BudgetBase*, 2> getBudgets() {return budgets;}

    BenefitCostInlineAdvisor(Module &M, FunctionAnalysisManager &FAM, BenefitCostInlineOrder *inlineOrder,
        SmallVector<BudgetBase*, 2> budgets, std::optional<InlineContext> IC = std::nullopt) : InlineAdvisor(M, FAM, IC) {
        
        this->inlineOrder = inlineOrder;
        for(BudgetBase* b : budgets) b->initBudget(M);
        this->budgets = budgets;
    }

    protected:
        std::unique_ptr<InlineAdvice> getAdviceImpl(CallBase &CB);

        //TODO change if this is used in production, good enough for research project
        std::unique_ptr<InlineAdvice> getMandatoryAdvice(CallBase &CB, bool Advice) {
            return getAdviceImpl(CB);
        }

    private:
        BenefitCostInlineOrder *inlineOrder;
        SmallVector<BudgetBase*, 2> budgets;
};

class BenefitCostInlineAdvice : public InlineAdvice{
    public:
        BenefitCostInlineAdvice(BenefitCostInlineAdvisor *Advisor, CallBase &CB, OptimizationRemarkEmitter &ORE, bool IsInliningRecommended) 
                : InlineAdvice(Advisor, CB, ORE, IsInliningRecommended) {

            bcAdvisor = Advisor;
            this->CB = &CB;
        }

    private:
        BenefitCostInlineAdvisor* bcAdvisor;
        void doForBudgetBase(std::function<void(BudgetBase*)> action);

    protected:
        CallBase* CB;
        void doOnInline(std::function<void(BudgetBase*, BenefitCostInlineOrder*)> action);
        void recordInliningImpl(); //UPDATE COSTS
        void recordInliningWithCalleeDeletedImpl();
        void recordUnsuccessfulInliningImpl(const InlineResult &Result);
        void recordUnattemptedInliningImpl();
};


#endif