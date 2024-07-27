#!/bin/sh
# SPDX-License-Identifier: BSD-2-Clause

. utils/dir_stack.sh
. utils/err.sh
. utils/exists.sh

if ! exists tar; then
    err "Please install tar"
    exit 1
fi

pushd sources

if ! [ -d "musl-$MUSL_VERSION" ]; then
    echo ":: Extracting musl libc"
    echo ":: Log file is musl.extract.log"
    tar xvf musl.tgz > musl.extract.log
fi
echo ":: Musl libc extracted"

popd
