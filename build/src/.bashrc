#!/usr/bin/env bash
export PATH="/app:/app/.local/bin:$PATH"

if [ -f "BANNER" ]; then
    cat BANNER
    # shellcheck disable=SC2154
    echo -e "XDT99 version: $xdt99   /   EASY-XDT99 version: $easyxdt99\n\n"
else
    exit 255
fi
