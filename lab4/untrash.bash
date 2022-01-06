#!/bin/bash

file="$*"
echo $file
trash="/home/admin/.trash"
trashLog="$trash.log"

grep -- "$file " "$trashLog" | while read line
do
echo $line;

  current_file=$(echo "$line" | awk '{$NF=""} 1')
  thrash_file=$(echo "$line" | awk '{ print $NF }')
  echo -n "Restore file ?(Yes/No)"
  read ans < /dev/tty
  if [[ "$ans" == "Yes" ]]
  then
    path=$(echo "$current_file" | grep -Eo '.*\/')
    if [ ! -d "$path" ]
      then
      echo "Original directory doesn't exist, file restored in $HOME directory"
      path="$/home/admin"
    fi;
    path="$path/$file"
    thrash_file="$trash/$thrash_file"
    ln "$thrash_file" "$path"
    rm $thrash_file
  fi
done
