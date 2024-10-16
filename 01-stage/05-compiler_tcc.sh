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

if ! exists patch; then
    err "Please install patch"
    exit 1
fi

pushd sources

if ! [ -f "tcc.compiled" ]; then
    pushd tinycc
    echo ":: Patching TinyCC"
    log_both tcc.patch.log patch -p1 < ../../patches/tinycc_protolibc.diff
    echo ":: Configuring TinyCC"
    log tcc.configure.log ./configure $TCC_CFG
    echo ":: Compiling TinyCC"
    log_both tcc.compilation.log make -j$(nproc)
    popd

    touch tcc.compiled
fi
echo ":: TinyCC compiled"

popd
