#!/bin/bash

export LLVM_DIR=/usr/lib/llvm-17
clang -O0 -Xclang -disable-O0-optnone -fpass-plugin=/home/flexone/thesis/build/lib/libRequiredPassesForOptimizerStage.so -flto --ld-path=ld.lld-17 -Wl,--load-pass-plugin=/home/flexone/thesis/build/lib/libDefaultDynamicAdvisor.so -Wl,-mllvm=-load=/home/flexone/thesis/build/lib/libDefaultDynamicAdvisor.so -Wl,-mllvm=-advisor=ADVISOR_VALUE_RP_SIZE -Wl,-mllvm=-size-increase-limit=1.5 -Wl,-plugin-opt=-regalloc=greedy -Wl,-mllvm=-debug-pass=Executions "$@"