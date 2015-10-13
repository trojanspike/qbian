#!/usr/bin/env bash

# update / upgrade -> install resolvconf
# service networking restart && \
# resolvconf -u && \
# reboot

#@ https://www.raspberrypi.org/forums/viewtopic.php?p=198148
# sudo udevadm info --path=/sys/class/gpio --attribute-walk
## give $USER PERMS to gpio

chmod +x /root/_Provisioning/*
if [ -d /sys/class/gpio/ ]; then
  export "HAS_GPIO=true"
else
  export "HAS_GPIO=false"
fi

if [ -d /sys/class/gpio ] && [ ! -f /root/_Provisioning/provision-device.complete ]; then
  /root/_Provisioning/provision-device && \
  touch /root/_Provisioning/provision-device.complete
else
	echo "Provisioning from device already complete";
fi

if [ ! -d /sys/class/gpio ] && [ ! -f /root/_Provisioning/provision-qemu.complete ]; then
  /root/_Provisioning/provision-qemu && \
  touch /root/_Provisioning/provision-qemu.complete
else
	echo "Provisioning from qemu already complete";
fi
