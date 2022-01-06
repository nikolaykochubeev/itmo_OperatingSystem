#!/bin/bash

lsof | awk '{print $2 " : " $9}' | grep 'libc-[0-9.]\+\.so'
