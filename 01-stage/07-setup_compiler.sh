#!/bin/sh
# SPDX-License-Identifier: BSD-2-Clause

. utils/dir_stack.sh
. utils/err.sh
. utils/exists.sh
. utils/logger.sh

pushd sources

if ! [ -f "compilers.setup" ]; then
    pushd $ROOTFS/bin
    cp -rf $SRCDIR/scripts/* .
    popd
    touch compilers.setup
fi

popd
