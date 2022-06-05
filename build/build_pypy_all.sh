#!/usr/bin/env bash

export PATH=.:$PATH

pyver=${1:-3.9}

# Build XDT99 3.X series on PyPy 3.X image
build.sh 3.5.0 library/pypy "$pyver" &
build.sh 3.4.0 library/pypy "$pyver" &
build.sh 3.3.2 library/pypy "$pyver" &
build.sh 3.3.1 library/pypy "$pyver" &
build.sh 3.3.0 library/pypy "$pyver" &
build.sh 3.2.0 library/pypy "$pyver" &
build.sh 3.1.0 library/pypy "$pyver" &
build.sh 3.0.0 library/pypy "$pyver" &
