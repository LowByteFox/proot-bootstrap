#!/bin/sh
# SPDX-License-Identifier: BSD-2-Clause

. utils/dir_stack.sh
. utils/err.sh
. utils/exists.sh
. utils/logger.sh

if ! exists gcc; then
    err "Please install gcc"
    exit 1
fi

if ! exists make; then
    err "Please install make"
    exit 1
fi

pushd sources

if ! [ -f "musl.compiled" ]; then
    pushd musl-$MUSL_VERSION
    echo ":: Configuring musl libc"
    log musl.configure.log ./configure $MUSL_CFG
    echo ":: Compiling musl libc"
    log_both musl.compilation.log make -j$(nproc)
    popd

    touch musl.compiled
fi
echo ":: Musl libc compiled"

popd
