# download miniconda
curl https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o "$HOME/miniconda3_latest.sh"
chmod +x $HOME/miniconda3_latest.sh
$HOME/miniconda3_latest.sh -b -p $HOME/miniconda3

cat >> ~/.bashrc << END
PATH=\$HOME/miniconda3/bin:\$PATH
END
source $HOME/.bashrc

conda create -n "moseq2" python=3.6 -y
source activate moseq2

conda install -y -c conda-forge ffmpeg
conda install -y jupyter ipykernel nb_conda

# ssh-keygen -t rsa -b 4096 -C "markowitzmeister@gmail.com"
# eval "$(ssh-agent -s)"
# ssh-add -k ~/.ssh/id_rsa

# read -p "Copy the ssh key to Github, press enter to continue..."

# run this on the controller node for authorizing copying from buckets 
# gsutil config

git config --global user.email "markowitzmeister@gmail.com"
git config --global user.name "Jeffrey Markowitz"
git config --global credential.helper "cache --timeout=3600"

pip install git+https://jmarkow@github.com/dattalab/moseq2-extract.git
pip install git+https://jmarkow@github.com/dattalab/moseq2-pca.git@v0.1.2
pip install git+https://jmarkow@github.com/dattalab/moseq2-model.git@v0.1.2 --process-dependency-links
pip install git+https://jmarkow@github.com/dattalab/moseq2-viz.git
pip install git+https://jmarkow@github.com/dattalab/moseq2-batch.git@v0.1.2
pip install dask_ml xgboost dask_xgboost tensorflow ipycache memory_profiler nbdime

mkdir $HOME/dev
git clone https://github.com/dattalab/usv-notebooks.git $HOME/dev/use-notebooks
git clone https://github.com/dattalab/mouse-rt-classifier.git $HOME/dev/mouse-rt-classifier
git clone https://github.com/dattalab/modeling-notebooks.git $HOME/dev/modeling-notebooks
