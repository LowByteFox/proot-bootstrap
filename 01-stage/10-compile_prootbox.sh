#!/bin/sh
# SPDX-License-Identifier: BSD-2-Clause

. utils/dir_stack.sh
. utils/err.sh
. utils/exists.sh
. utils/logger.sh

. ./activate.sh
popd

pushd sources

if ! [ -f "prootbox.compiled" ]; then
    pushd prootbox
    echo ":: Compiling ProotBox"
    log_both prootbox.compilation.log ./build.sh
    popd

    touch prootbox.compiled
fi
echo ":: ProotBox compiled"

popd

deactivate
