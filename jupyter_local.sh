port=$(shuf -i 20000-30000 -n 1)

echo -e "\nStarting Jupyter Notebook on port ${port} on the $(hostname) server."
echo -e "\nSSH tunnel command: ssh -NL ${port}:localhost:${port} ${USER}@$(hostname)"
echo -e "GCE tunnel command: gcloud compute ssh $(hostname) -- -NL ${port}:localhost:${port}"
echo -e "\nLocal URI: http://localhost:${port}"

source activate moseq2
cd ${HOME}
jupyter notebook --no-browser --port=${port}
