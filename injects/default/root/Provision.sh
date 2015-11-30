#!/usr/bin/env bash

IS_DEVICE=$1
### Run some logic or run a script
if [ "$IS_DEVICE" == true ]; then
  echo "Running provision for device environment" && \
	# Only upgrade when on device so that /boot can be updated & upgraded.
	# Note that pi /boot dir doesn't get mounted the same in the emulator compared to the device
  apt-get update && apt-get -f install -y && apt-get upgrade -y && apt-get -f install -y
	# You could leave this until a later image if you want to.
else
  echo "Running provision for qemu environment" && \
	# active init.d qbian-provision
	# TODO -> udev rules for /var/cache/man -> man:root
	chmod 0755 /etc/ && chmod 0644 /etc/bash.bashrc && apt-get update && apt-get install vim -y && update-rc.d qbian-provision defaults
fi

exit 0
