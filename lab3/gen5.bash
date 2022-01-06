#!/bin/bash

while true;
do
    read line;
    echo "$line" > pipe
    if [[ "$line" == "QUIT" ]];
    then
	echo "Stopped"
	exit 0
    fi
    if [[ "$line" != [0-9] && "$line" != "+" && "$line" != "*" ]];
    then
	echo "Error generator"
	exit 1
    fi
done
