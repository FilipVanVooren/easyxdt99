#!/usr/bin/env sh

# shellcheck disable=SC1091
. /etc/os-release

if [ "$*" = "" ]; then
    if [ -f "/app/.bashrc" ]; then
        . /app/.bashrc
    fi
else
    exec "$@"
fi
