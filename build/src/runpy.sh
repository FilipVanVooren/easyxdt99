#!/usr/bin/env bash

# Wrapper for running python program passing all arguments.
# Should be called as symlink target only.

PYSCRIPT=$(basename "$0").py

if [[ -f "xdt99/$PYSCRIPT" ]]; then
    python3 "xdt99/${PYSCRIPT}" "$@"
else
    exit 255
fi
