#!/bin/bash

file="$PWD/$*"

if [[ $# != 1 || ! -f $file ]];
then
	echo "Args must be path to file";
	exit 1
fi

if [[ ! -d /home/admin/.trash ]]
then
	mkdir /home/admin/.trash
	touch /home/admin/.trash.log
fi

data_file_name=$(date +"%y_%m_%d-%T")
ln "$file" "/home/admin/.trash/$data_file_name"
echo "$file" "$data_file_name" >> ~/.trash.log
rm -rf "$file"
