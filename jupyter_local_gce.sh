port=$(shuf -i 20000-30000 -n 1)

echo -e "\nStarting Jupyter Notebook on port ${port} on the $(hostname) server."
echo -e "\nSSH tunnel command: ssh -NL ${port}:localhost:${port} ${USER}@$(hostname)"

zone=( `gcloud compute instances list --filter="name=($(hostname))" --format='csv[no-heading](zone)'` )
project=( `gcloud compute instances describe $(hostname) --zone=$zone | grep zone |  grep projects | sed 's/.*projects\/\([a-z|\-]*\)\/.*/\1/' | head -1`)

echo -e "GCE tunnel command: gcloud compute --project=${project} ssh --zone=${zone} $(hostname) -- -NL ${port}:localhost:${port}"
echo -e "\nLocal URI: http://localhost:${port}"

source activate moseq2
cd ${HOME}
jupyter notebook --no-browser --port=${port}
