#!/bin/bash

mkfifo pipe
./handler5.bash&./gen5.bash
rm pipe
