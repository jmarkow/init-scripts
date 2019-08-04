# download miniconda
curl https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o "$HOME/miniconda3_latest.sh"
chmod +x $HOME/miniconda3_latest.sh
$HOME/miniconda3_latest.sh -b -p $HOME/miniconda3

cat >> ~/.bashrc << END
PATH=\$HOME/miniconda3/bin:\$PATH
END
source $HOME/.bashrc
conda init bash

git config --global user.email "markowitzmeister@gmail.com"
git config --global user.name "Jeffrey Markowitz"
git config --global credential.helper "cache --timeout=3600"
mkdir $HOME/dev

git clone https://github.com/jmarkow/init-scripts $HOME/dev/init-scripts

./gce-cluster-bootstrap-repos.sh

conda create -n "moseq2" python=3.6 -y
conda activate moseq2
./gce-cluster-boostrap-env.sh

conda create -n "moseq2-gpu" python=3.6 -y
conda activate moseq2-gpu
./gce-cluster-bootstrap-env.sh
./gce-cluster-bootstrap-env-gpu.sh
