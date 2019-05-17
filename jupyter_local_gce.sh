if [ -z "$JUPYTER_PORT" ]; then 
	port=$(shuf -i 20000-30000 -n 1)
else
	port=$JUPYTER_PORT
fi

echo -e "\nStarting Jupyter Notebook on port ${port} on the $(hostname) server."
echo -e "\nSSH tunnel command: ssh -NL ${port}:localhost:${port} ${USER}@$(hostname)"

zone=( `gcloud compute instances list --filter="name=($(hostname))" --format='csv[no-heading](zone)'` )
project=( `gcloud compute instances describe $(hostname) --zone=$zone | grep zone |  grep projects | sed 's/.*projects\/\([a-z|\-]*\)\/.*/\1/' | head -1`)
external_ip=( `gcloud compute instances list | grep $(hostname) |  awk '{print $--NF}'` )

echo -e "GCE tunnel command: gcloud compute --project=${project} ssh --zone=${zone} $(hostname) -- -NL ${port}:localhost:${port}"
echo -e "\nLocal URI: http://localhost:${port}"
echo -e "Local URI: http://localhost:${port}"
echo -e "Remote URI: http://${external_ip}:${port}"

source activate moseq2
cd ${HOME}
jupyter notebook --no-browser --port=${port} --ip=0.0.0.0 --NotebookApp.custom_display_url="http://$external_ip:$port"
