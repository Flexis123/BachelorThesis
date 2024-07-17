#!/bin/bash

export LLVM_DIR=/usr/lib/llvm-17
clang -O3 -fno-discard-value-names -fprofile-instr-use -fpass-plugin=/home/flexone/thesis/build/lib/libRequiredPassesForOptimizerStage.so -flto --ld-path=ld.lld-17 -Wl,-mllvm=-enable-module-inliner -Wl,--load-pass-plugin=/home/flexone/thesis/build/lib/libDefaultDynamicAdvisor.so -Wl,--save-temps -Wl,-mllvm=-load=/home/flexone/thesis/build/lib/libDefaultDynamicAdvisor.so -Wl,-mllvm=-advisor=ADVISOR_VALUE_RP_SIZE -Wl,-mllvm=-size-increase-limit=1.5 -Wl,-plugin-opt=-regalloc=greedy  -v -Wl,--lto-CGO2 "$@"