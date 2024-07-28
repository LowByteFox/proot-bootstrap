#!/bin/sh
# SPDX-License-Identifier: BSD-2-Clause

. utils/dir_stack.sh
. utils/err.sh
. utils/exists.sh

if ! exists git; then
    err "Please install git"
    exit 1
fi

pushd sources

if ! [ -d tinycc ]; then
    echo ":: Downloading TinyCC"
    git clone --depth 1 https://repo.or.cz/tinycc.git
fi

echo ":: TinyCC downloaded"

popd
