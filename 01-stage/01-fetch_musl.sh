#!/bin/sh
# SPDX-License-Identifier: BSD-2-Clause

. utils/dir_stack.sh
. utils/err.sh
. utils/exists.sh

if ! exists curl; then
    err "Please install curl"
    exit 1
fi

pushd sources

if ! [ -f musl.tgz ]; then
    echo ":: Downloading musl libc"
    curl -o musl.tgz https://musl.libc.org/releases/musl-$MUSL_VERSION.tar.gz
fi

echo ":: Musl libc downloaded"

popd
