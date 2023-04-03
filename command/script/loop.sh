#!/bin/bash

for SERVER_NAME in cent1 cent2 cent3
do
	echo ${SERVER_NAME}
done

for NUM in $(seq 1 3)
do
	echo "cent${NUM}"
done

NUM=1

while [ "${NUM}" -le 3 ];
do
	echo "cent${NUM}"
	NUM=$(( ${NUM} + 1 ))
done
