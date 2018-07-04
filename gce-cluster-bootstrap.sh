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

conda install -c conda-forge ffmpeg
mkdir $HOME/python_repos/

git clone https://jmarkow@github.com/dattalab/moseq2-extract.git $HOME/python_repos/moseq2-extract
git clone https://jmarkow@github.com/dattalab/moseq2-pca.git $HOME/python_repos/moseq2-pca
git clone https://jmarkow@github.com/dattalab/moseq2-model.git $HOME/python_repos/moseq2-model
git clone https://jmarkow@github.com/dattalab/moseq2-viz.git $HOME/python_repos/moseq2-viz
git clone https://jmarkow@github.com/dattalab/moseq2-batch.git $HOME/python_repos/moseq2-batch

pip install -e $HOME/python_repos/moseq2-extract
pip install -e $HOME/python_repos/moseq2-pca
pip install -e $HOME/python_repos/moseq2-model --process-dependency-links
pip install -e $HOME/python_repos/moseq2-viz
pip install -e $HOME/python_repos/moseq2-batch

git config --global user.email "markowitzmeister@gmail.com"
git config --global user.name "Jeffrey Markowitz"
