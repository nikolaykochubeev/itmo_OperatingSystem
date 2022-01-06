#!/bin/bash

:> 4.txt
for pid in $(ps -axo pid)
do
        if [[ -r /proc/$pid/status && -r /proc/$pid/sched ]]
        then
                PPid=$(grep -h -s -w PPid "/proc/$pid/status" | awk '{print $2}')
                sum_exec_runtime=$(grep -h -s -w se.sum_exec_runtime "/proc/$pid/sched" | awk '{print $3}') 
                nr_switches=$(grep -h -s -w nr_switches "/proc/$pid/sched" | awk '{print $3}')

                if [[ ${nr_switches} -ne "" ]]
                then
                        avg_time=$(echo "$sum_exec_runtime / $nr_switches" | bc -l)
                fi

                echo $pid $PPid $avg_time >> 4.txt
        fi
done

echo "$(sort -n -k 2 4.txt | awk '{print "ProcessID = "$1" : Parent_ProcessID = "$2" : Average_Running_Time = "$3}')" > 4.txt

