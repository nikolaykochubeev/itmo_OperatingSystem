#!/bin/bash

:> 7.txt
begin=()
end=()
pids=()
cmdline=()

for pid in $(ps -axo pid)
do
        if [[ -r /proc/$pid/io ]]
        then
                begin[$pid]=$(grep -s "rchar" /proc/$pid/io | awk '{print $2}')
                pids[$pid]=$pid
                cmdline[$pid]=$(cat /proc/$pid/cmdline | tr -d '\0')
        fi
done

sleep 60

for pid in "${pids[@]}"
do
        end[$pid]=$(grep -s "rchar" /proc/$pid/io | awk '{print $2}')
done

for pid in "${pids[@]}"
do
        diff=$(echo "${end[$pid]} - ${begin[$pid]}" | bc)
        echo $pid $diff ${cmdline[$pid]} >> 7.txt
done

sort -n -r -k 2 7.txt | head -3 | awk '{print $1":"$2":"$3}'
