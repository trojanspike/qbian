#!/usr/bin/env bash
COMMAND=$1 # if [$COMMD = start | stop | reload]


if [ "$COMMAND" == "start" ];then
	if [ -d ~/c9sdk ];then
		forever start ~/c9sdk/server.js -p 8080 -l 0.0.0.0  -w ~/ --collab true --packed false -a :
	fi
fi

if [ "$COMMAND" == "reload" ];then
	cd ~/Server && npm run service-reload
fi

if [ "$COMMAND" == "stop" ];then
	cd ~/Server && npm run service-stop
fi
