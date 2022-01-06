#!/bin/bash

ps -A -o pid,command | grep "/sbin" | awk '{print $1}' > 2.txt
