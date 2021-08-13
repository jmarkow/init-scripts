#!/bin/bash
# example
#
# dir1="new_path"
# dir2="backup_path"
#
# ./o2_backup_check.sh $1 $2
date;hostname;pwd

if [ -n "$1" ] && [ -n "$2" ]; then
  echo -e "Checking backup between directories ${1} and ${2}"
  output=$(rsync -niac ${1} ${2})
  echo -e "$output"
  if [ -z "$output" ]; then
    echo -e "Directories ${1} and ${2} are identical"
  else
    echo -e "Directories ${1} and ${2} are different, see previous output for details"
  fi
else
  echo -e "This script requires two arguments (the input and output directory)"
fi

date
