#!/bin/bash

export LLVM_DIR=/usr/lib/llvm-17
$LLVM_DIR/bin/clang -O0 -Xclang -disable-O0-optnone -fpass-plugin=build/lib/libRequiredPassesForOptimizerStage.so -fprofile-instr-generate=pgo_data -flto --ld-path=ld.lld  -Wl,-plugin-opt=-regalloc=greedy  -Wl,--lto-CGO2 -Wl,-mllvm=-debug-pass=Arguments -v "$@"  -o test_prog.o
./test_prog.o
llvm-profdata merge -output=default.profdata pgo_data
