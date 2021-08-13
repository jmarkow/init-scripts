#!/bin/bash
# example
#
# dir1="new_path"
# dir2="backup_path"
#
# ./o2_backup.sh $dir1 $dir2
date;hostname;pwd

if [ -n "$1" ] && [ -n "$2" ]; then
  echo -e "Starting backup between directories ${1} and ${2}"
  rsync -avu --stats --progress ${1} ${2}
  echo -e "Backup between ${1} and ${2} complete!"
  date
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
