#!/bin/bash

nice -n 20 ./gen4.bash&
nice -n 10 ./gen4.bash&
nice -n 0 ./gen4.bash&
