#!/bin/bash

uid=$1
./handlerChat.bash&
while true;
do
    read line;
    if [[ "$line" == "QUIT" ]];
    then
	echo "$uid:$line" >> pipe
	exit 0
    else
	echo "$uid:$line" >> pipe
    fi
done
