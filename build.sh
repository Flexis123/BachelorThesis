#!/bin/bash

export LLVM_DIR=/usr/lib/llvm-17
mkdir -p build
cd build
cmake -DLT_LLVM_INSTALL_DIR=$LLVM_DIR /home/flexone/thesis
make