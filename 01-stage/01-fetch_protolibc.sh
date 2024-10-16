#!/bin/sh
# SPDX-License-Identifier: BSD-2-Clause

. utils/dir_stack.sh
. utils/err.sh
. utils/exists.sh

if ! exists git; then
    err "Please install git"
    exit 1
fi

pushd sources

if ! [ -d protolibc ]; then
    echo ":: Downloading protolibc"
    git clone --depth=1 https://git.sr.ht/~lowbytefox/protolibc

    echo ":: Patching Makefile"
    pushd protolibc
    sed -i 's|PREFIX = /usr/local|PREFIX = /usr|' Makefile
    popd
fi

echo ":: Protolibc downloaded"

popd
