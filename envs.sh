#!/bin/sh
# SPDX-License-Identifier: BSD-2-Clause

# The purpose of this file is to configure projects

MUSL_VERSION="1.2.5"
MUSL_CFG="--prefix=/usr --enable-debug"
export MUSL_VERSION
export MUSL_CFG

TCC_CFG="--config-musl --prefix=/usr --sysroot=$ROOTFS"
export TCC_CFG
