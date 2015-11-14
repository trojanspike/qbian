#!/usr/bin/env bash

while [ true ];
do
  echo "25=0" > /dev/pi-blaster
  sleep 0.4
  echo "25=0.01" > /dev/pi-blaster
  sleep 0.4
  echo "25=0.015" > /dev/pi-blaster
  sleep 0.4
  echo "25=0.016" > /dev/pi-blaster
  sleep 0.4
  echo "25=0.017" > /dev/pi-blaster
  sleep 0.4
  echo "25=0.018" > /dev/pi-blaster
  sleep 0.4
  echo "25=0.02" > /dev/pi-blaster
  sleep 0.4
  echo "25=0.04" > /dev/pi-blaster
  sleep 0.4
  echo "25=0.06" > /dev/pi-blaster
  sleep 0.4
  echo "25=0.08" > /dev/pi-blaster
  sleep 0.4
  echo "25=0.01" > /dev/pi-blaster
done
