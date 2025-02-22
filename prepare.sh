#!/bin/sh
# SPDX-License-Identifier: BSD-2-Clause

. utils/dir_stack.sh

./clean.sh

rm -rf rootfs

echo ":: Preparing root filesystem"

mkdir rootfs sources logs
pushd rootfs

echo ":: Creating directories"

mkdir boot dev etc home mnt proc root sys tmp usr var
mkdir -p usr/{bin,include,lib,sbin,share}
mkdir -p usr/local/{bin,include,lib,sbin,share}
for dir in bin lib sbin; do
    ln -s usr/$dir $dir
done

echo ":: Linking sources to /usr/src"
ln -s ../../sources usr/src

popd
