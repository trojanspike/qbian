#!/bin/sh
### BEGIN INIT INFO
# Provides:          app-start
# Required-Start:
# Required-Stop:
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description:
### END INIT INFO


PATH=/usr/share/nvm:/sbin:/usr/sbin:/bin:/usr/bin

. /lib/init/vars.sh
. /lib/lsb/init-functions


do_start() {
#	nvm use iojs &&
# http://blog.nodejitsu.com/keep-a-nodejs-server-up-with-forever/
	# forever start -c "nodemon --harmony" app.js --exitcrash
	/bin/su - {USER} -c 'cd ~/ && forever -c "node --harmony_arrow_functions" start ~/Server/app.js'
	/bin/su - {USER} -c 'cd ~/ && forever -c "node --harmony_arrow_functions" start ~/Server/gpio.js'
	touch /root/Server-app-js_success1
}

case "$1" in
    start)
	do_start
        ;;
    restart|reload|force-reload)
        echo "Error: argument '$1' not supported" >&2
        exit 3
        ;;
    stop)
        ;;
    *)
        echo "Usage: $0 start|stop" >&2
        exit 3
        ;;
esac

# update-rc.d app-start.sh defaults
# update-rc.d -f app-start.sh remove
# http://serverfault.com/questions/44400/run-a-shell-script-as-a-different-user
