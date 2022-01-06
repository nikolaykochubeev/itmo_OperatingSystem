#!/bin/bash

output=1
cmd="+"

term() {
    echo "Finished by signal"
    exit 0
}

sig1() {
    cmd="+"
}

sig2() {
    cmd="*"
}

trap "term" SIGTERM
trap "sig1" USR1
trap "sig2" USR2

while true;
do
    case $cmd in
	"+")
	    output=$(($output + 2))
	;;
	"*")
	    output=$(($output * 2))
	;;
    esac
    echo $output
    sleep 1s
done
