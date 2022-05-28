#!/usr/bin/env bash

ver=${1:-3.5.0}
echo "Prepare for building docker image with XDT99-$ver"
docker build --build-arg VERSION="${ver}" --tag "easyxdt99:${ver}" .
