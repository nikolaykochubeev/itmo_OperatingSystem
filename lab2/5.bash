#!/bin/bash

ppid=0
count=1
art_time=0
cat 4.txt |
while read line
do
	ppid_current=$(echo "$line" | awk '{print $7}')
	avg_time=$(echo "$line" | awk '{print $11}')
	if [[ "$ppid" == "$ppid_current" ]]
	then
		art_time=$(echo "scale=6; $art_time+$avg_time" | bc)
		count=$(($count+1))
	else
		art_time=$(echo "scale=6; $art_time/$count" | bc)
		echo "Average_Sleeping_Children_Of_ParentID = $ppid is $art_time"
		art_time=$avg_time
		count=1
		ppid=$ppid_current
	fi

	echo "$line"
done > 5.txt
art_time=$(echo "scale=6; $art_time/$count" | bc)
echo "Average_Sleeping_Children_Of_Parent = $ppid is $art_time" >> 5.txt
