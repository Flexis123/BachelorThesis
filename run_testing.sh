#!/bin/bash

export LLVM_DIR=/usr/lib/llvm-17
$LLVM_DIR/bin/clang -fno-discard-value-names -O -Xclang -disable-llvm-passes -mllvm -disable-llvm-optzns -S -emit-llvm inputs/src/$1.c -o inputs/llvm-ir/$1.ll
$LLVM_DIR/bin/opt -S -load-pass-plugin build/lib/libTesting.so --passes="test"  inputs/llvm-ir/$1.ll -o inputs/llvm-ir-opt/$1.ll
