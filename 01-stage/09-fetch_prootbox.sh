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

if ! [ -d prootbox ]; then
    echo ":: Downloading ProotBox"
    git clone --depth 1 https://git.sr.ht/~lowbytefox/prootbox
fi

echo ":: ProotBox downloaded"

popd
