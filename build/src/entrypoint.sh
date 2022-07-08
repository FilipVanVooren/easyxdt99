#!/usr/bin/env sh

# shellcheck disable=SC1091
. /etc/os-release

if [ -f "BANNER" ]; then
    cat BANNER
    # shellcheck disable=SC2154,SC3037
    echo "XDT99 $xdt99 / EASY-XDT99 $easyxdt99 / Python $pyver"
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
