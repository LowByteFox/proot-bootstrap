#!/bin/sh
# SPDX-License-Identifier: BSD-2-Clause

. utils/dir_stack.sh
. utils/err.sh
. utils/exists.sh
. utils/logger.sh

pushd sources

if ! [ -f "prootbox.installed" ]; then
    pushd prootbox
    echo ":: Installing ProotBox into the rootfs"
    cp prootbox $ROOTFS/bin
    popd

    echo ":: Setting up binaries from prootbox"
    pushd $ROOTFS
    ./bin/prootbox 2>&1 | while IFS= read -r line; do
        pushd $(echo $line | cut -d":" -f1)

        for binary in $(echo $line | cut -d ":" -f2); do
            if [ -f $binary ]; then
                rm $binary
            fi

            ln $ROOTFS/bin/prootbox $binary
        done

        popd
    done
    popd

    touch prootbox.installed
fi
echo ":: ProotBox installed in rootfs"

popd
