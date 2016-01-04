#!/usr/bin/env bash

if [ -z "$QBASE" ]; then
  QBASE="`dirname \"$0\"`"
fi

if [ ! $# -eq 3 ]; then
  echo "Not enought param start.sh"
  exit 0
fi


CONSOLE=""
EXTRA_CONFIG=""
if [ $consoleOnly == true ];then
	CONSOLE="console=ttyAMA0 console=ttyS0"
	EXTRA_CONFIG="-nographic -serial mon:stdio"
else
	EXTRA_CONFIG="-serial mon:stdio"
fi

if [ -z $memory ];then
  memory=512
fi

IMAGE=$1
SSH_PORT=$2
CONFIG=$3

###################################################
qemu-system-arm -kernel $QBASE/kernel-qemu \
-cpu arm1176 \
-m $memory \
-M versatilepb \
-no-reboot \
-append root="/dev/sda2 panic=1 format=ext4 rootfstype=ext4 rw $CONSOLE" \
-hda $IMAGE \
-redir tcp:$SSH_PORT::22 \
$EXTRA_CONFIG \
$CONFIG
#####################################################################
