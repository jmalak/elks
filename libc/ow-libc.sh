#!/usr/bin/env bash
#
make -f watcom.mk clean
make -f watcom.mk            # produces $TOPDIR/libc/libc.lib, required for ewlink
cd $TOPDIR/elkscmd/basic
$TOPDIR/elks/tools/objtools/ewcc basic.c
$TOPDIR/elks/tools/objtools/ewcc host.c
$TOPDIR/elks/tools/objtools/ewcc host-stubs.c
$TOPDIR/elks/tools/objtools/ewlink basic.obj host.obj host-stubs.obj    # creates basic.os2
cp basic.os2 $TOPDIR/elkscmd/rootfs_template/root
cd $TOPDIR/libc

