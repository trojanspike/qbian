#!/usr/bin/env bash

IS_DEVICE=$1
### Run some logic or run a script
if [ "$IS_DEVICE" == true ]; then
  echo "Running provision for device environment :"
  apt-get update && apt-get -f install -y && apt-get upgrade -y && apt-get -f install -y
else
  echo "Running provision for qemu environment :"
	apt-get update && apt-get upgrade -y
fi

exit 0
