#!/usr/bin/env bash

IS_DEVICE=$1
chmod +x /root/_Provisioning/*
### Run some logic or run a script
if [ "$IS_DEVICE" == true ]; then
  echo "Doing for device"
  /root/_Provisioning/provision-device
else
	echo "Doing for qemu"
  /root/_Provisioning/provision-qemu
fi

exit 0
