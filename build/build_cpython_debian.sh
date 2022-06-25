#!/usr/bin/env bash

export PATH=.:$PATH

pyver=${1:-3.10}

# Build XDT99 3.X series on CPython 3.X-alpine image
build.sh 3.5.0 library/python "$pyver"
build.sh 3.4.0 library/python "$pyver"
build.sh 3.3.2 library/python "$pyver"
build.sh 3.3.1 library/python "$pyver"
build.sh 3.3.0 library/python "$pyver"
build.sh 3.2.0 library/python "$pyver"
build.sh 3.1.0 library/python "$pyver"
build.sh 3.0.0 library/python "$pyver"
