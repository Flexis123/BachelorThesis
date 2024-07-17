#include "BenefitCostInlineOrder.h"
#include <algorithm>
#include <vector>
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/Instructions.h"
#include <utility>
#include "Metrics.h"

void BenefitCostInlineOrder::push(const CallRecord &Elt){
    if(inlineHistoryId != Elt.second) inlinedCalls.clear();
    inlineHistoryId = Elt.second;
    if(inlineHistoryId != -1) inlinedCalls.push_back(Elt.first);
    
    calls.push_back({scoreFunction(Elt.first), Elt.first, Elt.second});
    std::push_heap(calls.begin(), calls.end(), cmpFunction);
}

bool BenefitCostInlineOrder::updateAndCheckCalls(InlineCandidate &ic){
    double_t newScore = scoreFunction(ic.CB);
    if(newScore != ic.lastScore){
        ic.lastScore = newScore;
        return true;
    }
    return false;
}


std::pair<CallBase *, int> BenefitCostInlineOrder::pop(){
    while(updateAndCheckCalls(calls.front())){ //continue looping iff. the score is new
        std::pop_heap(calls.begin(), calls.end(), cmpFunction);
        std::push_heap(calls.begin(), calls.end(), cmpFunction);
    }
    
    std::pop_heap(calls.begin(), calls.end(), cmpFunction);
    InlineCandidate ret = calls.back();
    calls.pop_back();
    return std::make_pair(ret.CB, ret.inlineHistoryId);
}


void BenefitCostInlineOrder::erase_if(function_ref<bool(CallRecord)> Pred){
    auto it = std::remove_if(calls.begin(), calls.end(), [&](InlineCandidate ic){
        return Pred(std::make_pair(ic.CB, ic.inlineHistoryId));
    });
    calls.erase(it, calls.end());
}