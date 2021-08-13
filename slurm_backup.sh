#!/bin/bash
#SBATCH --job-name backup
#SBATCH --output backup_%j.log
#SBATCH --partition medium
#SBATCH -n 4
#SBATCH --mem 20GB
#SBATCH --time 120:00:00

# example
#
# dir1="new_path"
# dir2="backup_path"
# sbatch --export=dir1=$dir1,dir2=$dir2 slurm_backup.sh
#
# note that export must come BEFORE the script name in the sbatch call
#
# you must define dir1 and dir2 via --export=dir1=$dir1,dir2=$dir2
date;hostname;pwd

if [ -n "$dir1" ] && [ -n "$dir2" ]; then
  echo -e "Starting backup between directories ${dir1} and ${dir2}"
  rsync -avu --stats --progress ${dir1} ${dir2}
  echo -e "Backup between ${dir1} and ${dir2} complete!"
  date
  output=$(rsync -niac ${dir1} ${dir2})
  echo -e "$output"
  if [ -z "$output" ]; then
    echo -e "Directories ${dir1} and ${dir2} are identical"
  else
    echo -e "Directories ${dir1} and ${dir2} are different, see previous output for details"
  fi
else
  echo -e "You must define the variables dir1 and dir2 via the sbatch export option"
fi

date
