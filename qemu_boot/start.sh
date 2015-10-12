#!/usr/bin/env bash

if [ -z "$QBASE" ]; then
  QBASE="`dirname \"$0\"`"
fi

if [ ! $# -eq 3 ]; then
  echo "Not enought param start.sh"
  exit 0
fi

IMAGE=$1
SSH_PORT=$2
CONFIG=$3

###################################################
qemu-system-arm -kernel $QBASE/kernel-qemu \
-cpu arm1176 \
-m 1024 \
-M versatilepb \
-no-reboot \
-append root="/dev/sda2 panic=1 format=ext4 rootfstype=ext4 rw" \
-hda $IMAGE \
-redir tcp:$SSH_PORT::22 \
-serial stdio \
$CONFIG
#####################################################################
