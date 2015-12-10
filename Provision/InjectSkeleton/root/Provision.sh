#!/usr/bin/env bash

if [ ! -f /root/qbian.conf ];then
	echo "Error : qbian.conf not found"
	exit 1
fi

source /root/qbian.conf

IS_DEVICE=$1
DEBIAN_FRONTEND=noninteractive
function provision_qemu(){
	apt-get update && apt-get install curl python python-smbus python-dev python3-dev python-pip -y && \
	# make the qbia-init service start
	update-rc.d qbian-init defaults
}

function provision_device(){
	apt-get update && apt-get -f install -y && apt-get upgrade -y && apt-get -f install -y
	#
	# Note : the defaul provision script I have in the default image will create a folder /qbianProvision
	# And create a file when the provision has ran, either $(cat ~/release)-qemu or $(cat ~/release)-device
	# Depending on env
	# Here's an example of over riding it for when we want to run both provision in device-mode
	if [ ! -f /qbianProvision/$(cat ~/release)-qemu ];then
		provision_qemu && touch /qbianProvision/$(cat ~/release)-qemu
		# Remember to create the provision file
	fi
}

### Run some logic or run a script
if [ "$IS_DEVICE" == true ]; then
  echo "Running provision for device environment :"
	provision_device
else
 	echo "Running provision for qemu environment :"
	provision_qemu
fi

exit 0
