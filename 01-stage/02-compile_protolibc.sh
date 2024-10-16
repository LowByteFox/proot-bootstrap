#!/bin/sh
# SPDX-License-Identifier: BSD-2-Clause

. utils/dir_stack.sh
. utils/err.sh
. utils/exists.sh
. utils/logger.sh

if ! exists tcc; then
    err "Please install tcc"
    exit 1
fi

if ! exists make; then
    err "Please install make"
    exit 1
fi

pushd sources

if ! [ -f "protolibc.compiled" ]; then
    pushd protolibc
    echo ":: Compiling protolibc"
    log_both protolibc.compilation.log make -j$(nproc)
    popd

    touch protolibc.compiled
fi
echo ":: Protolibc compiled"

popd
