#ifndef BENEFIT_COST_INLINE_ORDER_H
#define BENEFIT_COST_INLINE_ORDER_H

#include "llvm/Analysis/InlineOrder.h"
#include <queue>
#include "llvm/IR/Instructions.h"

using namespace llvm;

typedef std::pair<CallBase *, int> CallRecord;


struct InlineCandidate{
   double_t lastScore;
   CallBase* CB;
   int inlineHistoryId;
};

class BenefitCostInlineOrder : public InlineOrder<CallRecord>{

public:
   size_t size() { return calls.size(); }

   void push(const CallRecord &Elt);

   CallRecord pop();

   void erase_if(function_ref<bool(CallRecord)> Pred);

   inline SmallVector<CallBase*, 16>& getInlinedCalls() {return inlinedCalls;}

   //TODO  do something about calls to functions where the budget is exceeded if time allows

   BenefitCostInlineOrder(std::function<double_t(CallBase*)> scoreFunction){
      this->scoreFunction = scoreFunction;
      this->cmpFunction = [this](InlineCandidate c1, InlineCandidate c2) {
         return c1.lastScore < c2.lastScore;
      };
   }

private:
   SmallVector<InlineCandidate, 128> calls;
   SmallVector<CallBase*, 16> inlinedCalls;
   std::function<bool(InlineCandidate, InlineCandidate)> cmpFunction;
   std::function<double_t(CallBase*)> scoreFunction;
   int inlineHistoryId = -1;

   bool updateAndCheckCalls(InlineCandidate &ic);
};

#endif