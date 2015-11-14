#!/usr/bin/env bash

COMMAND=$1 # if [$COMMD = start | stop | reload]
if [ "$COMMAND" == "start" ];then
	cd ~/Server && npm start
fi

if [ "$COMMAND" == "reload" ];then
	echo "Reload scripts"
fi

if [ "$COMMAND" == "stop" ];then
	echo "Stopping scripts"
fi
