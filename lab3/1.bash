#!/bin/bash

d=$(date '+%FI%T')

mkdir ~/test && { echo "catalog test was created succesfully" > ~/report.txt ; touch ~/test/$d ; }

ping net_nikogo.ru || echo "${d} error" >> ~/report.txt
