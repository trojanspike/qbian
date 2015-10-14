#!/usr/bin/env bash

# update / upgrade -> install resolvconf
# service networking restart && \
# resolvconf -u && \
# reboot

#@ https://www.raspberrypi.org/forums/viewtopic.php?p=198148
# sudo udevadm info --path=/sys/class/gpio --attribute-walk
## give $USER PERMS to gpio

IS_DEVICE=$1
### Run some logic or run a script
if [ "$IS_DEVICE" == true ]; then
  echo "Doing for device"
  /root/_Provisioning/provision-device
else
  /root/_Provisioning/provision-qem
fi

exit 0
