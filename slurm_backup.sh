#!/bin/bash
#SBATCH --job-name backup
#SBATCH --output backup_%j.log
#SBATCH --partition medium
#SBATCH -n 4
#SBATCH --mem 20GB
#SBATCH --time 96:00:00

# example
#
# dir1="new_path"
# dir2="backup_path"
# sbatch slurm_backup.sh --export=dir1=$dir1,dir2=$dir2
#
# you must define dir1 and dir2 via --export=dir1=$dir1,dir2=$dir2, e.g.
date;hostname;pwd

if [ -n "$dir1" ] && [ -n "$dir2" ]; then
  rsync -avu --stats --progress ${dir1} ${dir2})
  echo -e "Backup between ${dir1} and ${dir2} complete!"
else
  echo -e "You must define the variables dir1 and dir2 via the sbatch export option"
fi

date
