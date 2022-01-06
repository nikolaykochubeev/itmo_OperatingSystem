#!/bin/bash

declare -i max
declare -i output

for pid in $(ps -axo pid)
do
        if [[ -r /proc/$pid/status ]]
        then
                memory=$(grep -s "VmHWM" /proc/$pid/status | awk '{print $2}')
                if [[ $memory != "" ]]
                then
                        if [[ $memory -gt $max ]]
                        then
                                output=$pid
                                max=$memory
                        fi
                fi
        fi
done

echo "PID:" $output "Memory:" $max
echo "top max pid $(top -b -n 1 | tail -n +8 | sort -n -r -k 10 | head -1 | awk '{print $1}')"
