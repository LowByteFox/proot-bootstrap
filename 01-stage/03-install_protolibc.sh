#!/bin/sh
# SPDX-License-Identifier: BSD-2-Clause

. utils/dir_stack.sh
. utils/err.sh
. utils/exists.sh
. utils/logger.sh

if ! exists make; then
    err "Please install make"
    exit 1
fi

pushd sources

if ! [ -f "protolibc.installed" ]; then
    pushd protolibc
    echo ":: Installing musl libc into the rootfs"
    log protolibc.install.log make DESTDIR="$ROOTFS" install
    popd

    touch protolibc.installed
fi

echo ":: Protolibc installed in rootfs"

popd
