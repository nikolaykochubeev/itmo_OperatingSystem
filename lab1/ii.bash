#!/bin/bash
read str
while [ $str != q ]
do
  out+=$str
  read str
done
echo $out
