#!/usr/bin/env sh
export PATH="/app:/app/.local/bin:$PATH"

# shellcheck disable=SC1091
. /etc/os-release

if [ -f "BANNER" ]; then
    cat BANNER
    # shellcheck disable=SC2154,SC3037
    echo "XDT99 $xdt99 / EASY-XDT99 $easyxdt99 / Python $pyver / $PRETTY_NAME"
    echo
    echo
else
    exit 255
fi


if [ "$*" = "" ]; then
    if [ -f "README" ]; then
        cat README
    fi
else
    exec "$@"
fi
