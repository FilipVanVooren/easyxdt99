#!/usr/bin/env bash
export PATH="/app:/app/.local/bin:$PATH"

if [ -f "BANNER" ]; then
    cat BANNER
    # shellcheck disable=SC2154
    echo "XDT99 $xdt99 / EASY-XDT99 $easyxdt99 / Python $pyver / $PRETTY_NAME"
    echo
    echo
fi
