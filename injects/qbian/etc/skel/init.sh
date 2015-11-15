#!/usr/bin/env bash
COMMAND=$1 # if [$COMMD = start | stop | reload]

if [ ! -d ~/c9sdk ];then
	c9-install && sudo reboot
fi

if [ "$COMMAND" == "start" ];then
	cd ~/Server && npm run service-start && \
	forever stop ~/c9sdk/server.js && \
	forever start ~/c9sdk/server.js -p 8080 -l 0.0.0.0  -w ~/ --collab true --packed false -a :
fi

if [ "$COMMAND" == "reload" ];then
	cd ~/Server && npm run service-reload
fi

if [ "$COMMAND" == "stop" ];then
	cd ~/Server && npm run service-stop
fi
