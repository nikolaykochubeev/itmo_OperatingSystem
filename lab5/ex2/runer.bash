#!/bin/bash


for i in $(seq 1 $1); do
	./mem.bash $2 &
	sleep 1s
done
