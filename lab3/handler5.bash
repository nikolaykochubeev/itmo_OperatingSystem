#!/bin/bash

cmd="+"
echo "Mode plus"
res=1
tail -f pipe |
while true;
do
    read line
    case $line in
        "+")
            cmd=$line
	    echo "Switched to plus"
	;;
	"*")
	    cmd=$line
	    echo "Switched to multipy"
	;;
	"QUIT")
	    pid=$(pidof -s tail)
	    kill $pid
	    echo "Quit"
	    exit 0
	;;
	[0-9])
		case $cmd in
		    "+")
			res=$(($res + $line))
			echo $res
		    ;;
		    "*")
			res=$(($res * $line))
			echo $res
		    ;;
		esac
	;;
	*)
	    pid=$(pidof -s tail)
	    kill $pid
	    echo "Inccorrect parameter"
	    exit 1
	;;
    esac
done
