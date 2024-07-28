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

if ! [ -f "musl.installed" ]; then
    pushd musl-$MUSL_VERSION
    echo ":: Installing musl libc into the rootfs"
    log musl.install.log make DESTDIR="$ROOTFS" install
    popd

    touch musl.installed
fi
echo ":: Musl libc installed in rootfs"

popd
