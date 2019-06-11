#!/bin/bash
#SBATCH --job-name backup_check
#SBATCH --output backup_check_%j.log
#SBATCH --partition medium
#SBATCH -n 4
#SBATCH --mem 20GB
#SBATCH --time 96:00:00

# you must define dir1 and dir2 via --export=dir1=$dir1,dir2=$dir2, e.g.
date;hostname;pwd

if [ -n "$dir1" ] && [ -n "$dir2" ]; then
  echo -e "Checking backup between directories ${dir1} and ${dir2}"
  output=$(rsync -niac ${dir1} ${dir2})
  echo -e "$output"
  if [ -z "$output" ]; then
    echo -e "Directories ${dir1} and ${dir2} are identical"
  else
    echo -e "Directories ${dir1} and ${dir2} are different, see previous output for details"
  fi
fi

date
