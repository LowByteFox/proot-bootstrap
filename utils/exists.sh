#!/bin/sh
# SPDX-License-Identifier: BSD-2-Clause

exists() {
    if which "$1" 2> /dev/null > /dev/null; then
        return 0
    fi

    return 1
}
