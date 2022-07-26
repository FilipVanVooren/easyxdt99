#!/usr/bin/env bash
export PATH="/app:/app/.local/bin:$PATH"

alias ll='ls --color=auto -al'

if [ -f "/app/BANNER" ]; then
    cat /app/BANNER
    # shellcheck disable=SC2154
    echo "XDT99 $xdt99 / EASY-XDT99 $easyxdt99 / Python $pyver"
    echo
    echo
fi
if [ "$*" = "" ]; then
    if [ -f "/app/README" ]; then
        cat /app/README
    fi
fi
