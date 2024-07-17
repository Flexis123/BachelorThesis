#!/bin/bash

export LLVM_DIR=/usr/lib/llvm-17
$LLVM_DIR/bin/clang -fno-discard-value-names -Xclang -disable-O0-optnone -S -emit-llvm inputs/src/$1.c -o inputs/llvm-ir/$1.ll
$LLVM_DIR/bin/opt  --passes="mem2reg,mergereturn,dot-cfg" -disable-output inputs/llvm-ir/$1.ll
dot -Tpdf .$2.dot -o $1_$2_cfg.pdf
