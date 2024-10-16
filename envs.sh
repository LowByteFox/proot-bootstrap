#!/bin/sh
# SPDX-License-Identifier: BSD-2-Clause

# The purpose of this file is to configure projects
export TCC_VERSION="0.9.27"
export TCC_CFG="--config-musl --prefix=/usr --sysroot=$ROOTFS --cc=tcc --config-bcheck=no --config-backtrace=no"
