#!/bin/bash
#SBATCH --job-name jupyter
#SBATCH --output jupyter_%j.log
#SBATCH --partition debug
#SBATCH -n 14
#SBATCH --mem 50GB
#SBATCH --time 120:00:00
date;hostname;pwd

# module add python
# export XDG_RUNTIME_DIR=${TMPDIR}
unset XDG_RUNTIME_DIR

port=$(shuf -i 20000-30000 -n 1)

echo -e "\nStarting Jupyter Notebook on port ${port} on the $(hostname) server."
echo -e "\nSSH tunnel command: ssh -NL ${port}:localhost:${port} ${USER}@$(hostname)"
echo -e "\nGCE tunnel command: gcloud compute ssh $(hostname) -- -NL ${port}:localhost:${port}"
echo -e "\nLocal URI: http://localhost:${port}"

# source ${HOME}/.bashrc
source activate moseq2
cd ${HOME}
jupyter notebook --no-browser --port=${port}

date
