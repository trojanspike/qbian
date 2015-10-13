#!/usr/bin/env bash

if [ -d /sys/class/gpio/ ]; then
  export "HAS_GPIO=true" # On real device
else
  export "HAS_GPIO=false" # On qemu
fi
