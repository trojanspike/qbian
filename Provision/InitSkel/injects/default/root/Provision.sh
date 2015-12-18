#!/usr/bin/env bash

echo "Running provision for qemu environment" && \
# active init.d qbian-provision
# TODO ? -> udev rules for /var/cache/man -> man:root
chmod 0755 /etc/ && chmod 0644 /etc/bash.bashrc && chown -R root:man /var/cache/man && apt-get update && apt-get install vim -y && update-rc.d qbian-provision defaults && \
echo "Provision complete : restarting" && sleep 5 && reboot

exit 0
