#!/bin/sh
# SPDX-License-Identifier: BSD-2-Clause


. utils/err.sh
. utils/dir_stack.sh

if ! [ -d rootfs ]; then
    err "Please run ./prepare.sh first"
    exit 1
fi

if [ "$0" != "$(basename $SHELL)" ]; then
    err "Source the file, do not run it!"
    exit 1
fi

ROOTFS=$(pwd)/rootfs

OLD_PROMPT="$PS1"
OLD_PATH="$PATH"

deactivate() {
    PS1=$OLD_PROMPT
    PATH=$OLD_PATH
    popd
    unset ROOTFS OLD_PROMPT OLD_PATH
    unset -f pushd popd deactivate err
}

PS1="(prootenv) $OLD_PROMPT"
PATH="$ROOTFS/usr/bin:$ROOTFS/usr/sbin:/usr/bin:/usr/sbin"

pushd rootfs
