#!/bin/bash
mask="[a-zA-Z0-9_.]+@[a-zA-Z0-9_]+\.[a-zA-Z]+"
grep -E -h -s -o -r -a $mask /etc/* > /home/admin/lab1/email.lst

