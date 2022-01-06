#!/bin/bash

ps -u admin -o pid,command | tail -n +2 | wc -l > 1.txt
ps -u admin -o pid,command | tail -n +2 >> 1.txt
