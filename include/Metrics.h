#ifndef INLINE_METRICS_H
#define INLINE_METRICS_H

#include "llvm/ADT/DenseMap.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include <stdint.h>
#include <math.h>
#include "llvm/Analysis/BlockFrequencyInfo.h"
#include <type_traits>
#include <concepts>

using namespace llvm;

class BudgetBase{
    public:
        virtual void onInline(Function* CalledFN, Function* Caller, const BasicBlock* CBParent, CallBase* CB, SmallVector<CallBase*, 16> &inlinedCalls) = 0;
        virtual void onInlineWithCalleeDeleted(Function* CalledFN, Function* Caller, const BasicBlock* CBParent, CallBase* CB, SmallVector<CallBase*, 16> &inlinedCalls) = 0;
        virtual void onUnsuccessfulInline(Function* CalledFN, Function* Caller, CallBase* CB) = 0; 
        virtual void onUnattemptedInlining(Function* CalledFN, Function* Caller, CallBase* CB) = 0;
        virtual bool canInline(CallBase* CB) = 0;
        virtual void initBudget(Module &M) = 0;

        virtual ~BudgetBase() {}
};

template <typename C, typename BT>
class Budget : public BudgetBase{
    public:
        bool canInline(CallBase* CB);
        
        C getFunctionBudgetLimit() {return budgetLimit;}
    
        virtual C getInlineCost(CallBase* CB) = 0;
        virtual ~Budget() {}



    protected:
        C budget;
        C budgetLimit;

};

template <typename C, typename BT>
bool Budget<C, BT>::canInline(CallBase *CB){
    return getInlineCost(CB) + budget <= budgetLimit; 
}


class SizeCost: public Budget<uint32_t, SizeCost>{

    public:
        SizeCost(Module &M, double_t sizeIncrease, FunctionAnalysisManager &_FAM): Budget(), FAM(_FAM) {
            this->sizeIncrease = sizeIncrease;
        }

        void onInline(Function* CalledFN, Function* Caller, const BasicBlock* CBParent, CallBase* CB, SmallVector<CallBase*, 16> &inlinedCalls);
        void onInlineWithCalleeDeleted(Function* CalledFN, Function* Caller, const BasicBlock* CBParent, CallBase* CB, SmallVector<CallBase*, 16> &inlinedCalls);
        void onUnsuccessfulInline(Function* CalledFN, Function* Caller, CallBase* CB); 
        void onUnattemptedInlining(Function* CalledFN, Function* Caller, CallBase* CB);

        uint32_t getBudgetValFor(Function *F);
        uint32_t getInlineCost(CallBase* CB);

        ~SizeCost() {}


    private:
        DenseMap<Function*, uint32_t> functionSizes;
        double_t sizeIncrease;
        FunctionAnalysisManager &FAM;
        void initBudget(Module &M);

        uint32_t updateCallerSize(Function* CalledFN, Function* Caller);

};

class RPCost: public Budget<double_t, RPCost>{
    public:

        RPCost(Module &M, double_t budgetLimit, FunctionAnalysisManager &_FAM): Budget(), FAM(_FAM) {
            this->budgetLimit = budgetLimit;
        }

        double_t getBudgetValFor(Function *F);
        double_t getInlineCost(CallBase* CB);
        
        void onInline(Function* CalledFN, Function* Caller, const BasicBlock* CBParent, CallBase* CB, SmallVector<CallBase*, 16> &inlinedCalls);
        void onInlineWithCalleeDeleted(Function* CalledFN, Function* Caller, const BasicBlock* CBParent, CallBase* CB, SmallVector<CallBase*, 16> &inlinedCalls);
        void onUnsuccessfulInline(Function* CalledFN, Function* Caller, CallBase* CB); 
        void onUnattemptedInlining(Function* CalledFN, Function* Caller, CallBase* CB);

    private:
        std::pair<double_t, double_t>& computeFunctionRpSumAndWeightSum(Function *F);
        std::pair<double_t, double_t> getInlineCostSumWeight(CallBase* CB, uint16_t CBrp);
        std::pair<double_t, double_t> getInlineCostSumWeight(Function* caller, Function *calledFn, const BasicBlock *callBB, uint16_t CBrp);
        DenseMap<Function*, std::pair<double_t, double_t>> functionRPs;
        DenseMap<CallBase*, uint16_t> callSiteRps;
        std::pair<double_t, double_t> globalRp;
        FunctionAnalysisManager &FAM;

        std::pair<double_t, double_t> updateCallerAndCallSitesRp(Function* CalledFN, Function* Caller, const BasicBlock* CBParent, CallBase* CB, SmallVector<CallBase*, 16> &inlinedCalls);

        void initBudget(Module &M);
};

#endif