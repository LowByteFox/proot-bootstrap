#!/bin/sh
# SPDX-License-Identifier: BSD-2-Clause

stack=""

pushd() {
    stack="$PWD:$stack"

    cd "$1"
}

popd() {
    if [ -z "$stack" ]; then
        return 0
    else
        dir="${stack%%:*}"
        stack="${stack#*:}"
        cd "$dir"
    fi
}
