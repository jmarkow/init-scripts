#!/bin/bash
#SBATCH --job-name jupyter
#SBATCH --output jupyter_%j.log
#SBATCH --partition small-gpu-b-preemptible
#SBATCH -n 14
#SBATCH --mem 50GB
#SBATCH --time 120:00:00

#sudo su - $(whoami)
source $HOME/.bashrc
date;hostname;pwd

# module add python
# export XDG_RUNTIME_DIR=${TMPDIR}
unset XDG_RUNTIME_DIR

if [ -z "$JUPYTER_PORT" ]; then 
	port=$(shuf -i 20000-30000 -n 1)
else
	port=$JUPYTER_PORT
fi

zone=( `gcloud compute instances list --filter="name=($(hostname))" --format='csv[no-heading](zone)'` )
project=( `gcloud compute instances describe $(hostname) --zone=$zone | grep zone |  grep projects | sed 's/.*projects\/\([a-z|\-]*\)\/.*/\1/' | head -1`)
external_ip=( `gcloud compute instances list | grep $(hostname) |  awk '{print $--NF}'` )

echo -e "\nStarting Jupyter Notebook on port ${port} on the $(hostname) server."
echo -e "SSH tunnel command: ssh -NL ${port}:localhost:${port} ${USER}@$(hostname)"
echo -e "GCE tunnel command: gcloud compute --project=${project} ssh --zone=${zone} $(hostname) -- -NL ${port}:localhost:${port}"
echo -e "Local URI: http://localhost:${port}"
echo -e "Remote URI: http://${external_ip}:${port}"

# source ${HOME}/.bashrc
source activate moseq2-gpu
cd ${HOME}
jupyter notebook --no-browser --port=${port} --ip=0.0.0.0 --NotebookApp.custom_display_url="http://$external_ip:$port"

date
