#!/bin/bash

function plus {
	echo "$1 + $2 = "
	echo $[ $1 + $2 ]
	echo
}

function minus {
	echo "$1 - $2 = "
	echo $[ $1 - $2 ]
	echo
}

function multi {
	echo "$1 * $2 = "
	echo $[ $1 * $2 ]
	echo
}

function div {
	echo "$1 / $2 = "
	if [ "$2" -eq 0 ]
	then
		echo "0으로 나눌 수 없습니다."
	else
		echo $[ $1 / $2 ]
	fi
	echo
}


plus 30 40
minus 10 3
multi 2 2
div 2 0
div 2 2

