#!/bin/bash

ARRAY=(one two three 4 5 6 7)

for i in $(seq 0 7)
do
	echo "${ARRAY[$i]}"
done
