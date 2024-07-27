#!/bin/sh
# SPDX-License-Identifier: BSD-2-Clause

. utils/dir_stack.sh
. utils/err.sh
. utils/exists.sh

if ! exists make; then
    err "Please install make"
    exit 1
fi

pushd sources

if ! [ -f "musl.installed" ]; then
    pushd musl-$MUSL_VERSION
    echo ":: Installing musl libc into the rootfs"
    echo ":: Log file is musl.install.log"
    DESTDIR="$ROOTFS" make install > ../musl.install.log
    popd

    touch musl.installed
fi
echo ":: Musl libc installed in rootfs"

popd
