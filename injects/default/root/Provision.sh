#!/usr/bin/env bash

if [ -d /sys/class/gpio/ ]; then
  export "HAS_GPIO=true"
else
  export "HAS_GPIO=false"
fi



if (( $HAS_GPIO == true )); then
  touch /root/has-gpio-true
fi

if (( $HAS_GPIO == false )); then
  touch /root/has-gpio-false
fi
