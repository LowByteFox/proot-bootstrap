#!/bin/sh
# SPDX-License-Identifier: BSD-2-Clause

. utils/dir_stack.sh
. utils/exists.sh
. utils/err.sh

if ! exists mkdir; then
    err "How are you even using your system?"
    exit 1
fi

./clean.sh

rm -rf rootfs

echo ":: Preparing root filesystem"

mkdir rootfs sources
pushd rootfs

echo ":: Creating directories"

mkdir boot dev etc home mnt proc root sys tmp usr var
mkdir -p usr/{bin,include,lib,lib64,sbin,share}
for dir in bin include lib lib64 sbin; do
    ln -s usr/$dir $dir
done

echo ":: Linking sources to /usr/src"
ln -s ../../sources usr/src

popd
