#!/bin/bash



tail -fn 0 pipe |
while true;
do
    read line
    case $line in
	"QUIT")
	    killall tail
	    echo "Chat has stopped"
	    exit 0
	;;
	*)
	    echo $line
	;;
    esac
done
