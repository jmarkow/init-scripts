conda install -y -c conda-forge ffmpeg
conda install -y jupyter ipykernel nb_conda

pip install ipycache memory_profiler nbdime dask[complete]
pip install git+https://jmarkow@github.com/dattalab/moseq2-extract.git
pip install git+https://jmarkow@github.com/dattalab/moseq2-pca.git
pip install git+https://jmarkow@github.com/dattalab/moseq2-model.git
pip install git+https://jmarkow@github.com/dattalab/moseq2-viz.git
pip install git+https://jmarkow@github.com/dattalab/moseq2-batch.git
nbdime config-git --enable --global

# ssh-keygen -t rsa -b 4096 -C "markowitzmeister@gmail.com"
# eval "$(ssh-agent -s)"
# ssh-add -k ~/.ssh/id_rsa
# read -p "Copy the ssh key to Github, press enter to continue..."
