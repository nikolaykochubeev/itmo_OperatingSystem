#!/bin/bash

grep -E "(WW)" /var/log/anaconda/X.log | sed "s/WW/Warning/" > /home/admin/lab1/full.log
grep -E "(II)" /var/log/anaconda/X.log | sed "s/II/Information/" >> /home/admin/lab1/full.log

