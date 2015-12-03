#!/usr/bin/env bash

IS_DEVICE=$1
chmod +x /root/_Provisioning/*
### Run some logic or run a script
if [ "$IS_DEVICE" == true ]; then
  echo "Provisioning for device"
	if [ ! -f /qbianProvision/qbian-c9-qemu ];then
		/root/_Provisioning/provision-qemu && touch /qbianProvision/qbian-c9-qemu && /root/_Provisioning/provision-device
	else
		/root/_Provisioning/provision-device
	fi
else
	echo "Provisioning for qemu"
  /root/_Provisioning/provision-qemu
fi

exit 0
