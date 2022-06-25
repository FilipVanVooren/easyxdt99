#!/usr/bin/env sh

# Wrapper for running python program passing all arguments.
# Should be called as symlink target only.

PYSCRIPT=$(basename "$0").py

if [ -f "xdt99-${xdt99}/$PYSCRIPT" ]; then
    python3 "xdt99-${xdt99}/${PYSCRIPT}" "$@"
else
    echo "ERROR: Could not run python script xdt99-${xdt99}/${PYSCRIPT}"
    exit 255
fi
