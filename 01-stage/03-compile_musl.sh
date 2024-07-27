#!/bin/sh
# SPDX-License-Identifier: BSD-2-Clause

. utils/dir_stack.sh
. utils/err.sh
. utils/exists.sh

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
    echo ":: Log file is musl.configure.log"
    ./configure $MUSL_CFG > ../musl.configure.log
    echo ":: Compiling musl libc"
    echo ":: Log file is musl.compilation.log"
    make -j$(nproc) > ../musl.compilation.log 2> ../musl.compilation.log
    popd

    touch musl.compiled
fi
echo ":: Musl libc compiled"

popd
