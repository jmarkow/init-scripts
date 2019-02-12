#!/bin/bash
#SBATCH --job-name jupyter
#SBATCH --output jupyter_%j.log
#SBATCH --partition debug
#SBATCH -n 14
#SBATCH --mem 50GB
#SBATCH --time 120:00:00
#SBATCH --gres gpu:1

#sudo su - $(whoami)
source $HOME/.bashrc
date;hostname;pwd

# module add python
# export XDG_RUNTIME_DIR=${TMPDIR}
unset XDG_RUNTIME_DIR

port=$(shuf -i 20000-30000 -n 1)

zone=( `gcloud compute instances list --filter="name=($(hostname))" --format='csv[no-heading](zone)'` )
project=( `gcloud compute instances describe $(hostname) --zone=$zone | grep zone |  grep projects | sed 's/.*projects\/\([a-z|\-]*\)\/.*/\1/' | head -1`)

echo -e "\nStarting Jupyter Notebook on port ${port} on the $(hostname) server."
echo -e "SSH tunnel command: ssh -NL ${port}:localhost:${port} ${USER}@$(hostname)"
echo -e "GCE tunnel command: gcloud compute --project=${project} ssh --zone=${zone} $(hostname) -- -NL ${port}:localhost:${port}"
echo -e "Local URI: http://localhost:${port}"

# source ${HOME}/.bashrc
source activate moseq2
cd ${HOME}
jupyter notebook --no-browser --port=${port}

date
