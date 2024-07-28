#!/bin/sh
# SPDX-License-Identifier: BSD-2-Clause

log() {
    file=$1
    shift
    echo ":: Log file is $file"
    $@ > $SRCDIR/logs/$file
}

log_err() {
    file=$1
    shift
    echo ":: Log file is $file"
    $@ 2> $SRCDIR/logs/$file
}

log_both() {
    file=$1
    shift
    echo ":: Log file is $file"
    $@ > $SRCDIR/logs/$file 2> $SRCDIR/logs/$file
}
