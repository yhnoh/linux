#!/bin/bash

## nginx start : nginx start

CMD=$1

case "${CMD}" in
start)
	echo "nginx start";;
stop)
	echo "nginx stop";;
reload)
	echo "nginx reload";;
configtest)
	echo "nginx config test";;
*)
	echo "사용방법: ./case.sh (start|stop|reload|configtest)"
esac
