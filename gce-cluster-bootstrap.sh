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

ssh-keygen -t rsa -b 4096 -C "markowitzmeister@gmail.com"
eval "$(ssh-agent -s)"
ssh-add -k ~/.ssh/id_rsa

read -p "Copy the ssh key to Github, press enter to continue..."

pip install git+ssh://git@github.com/dattalab/moseq2-extract.git@v0.1.1-track-smoothing
pip install git+ssh://git@github.com/dattalab/moseq2-pca.git@v0.1.1
pip install git+ssh://git@github.com/dattalab/moseq2-model.git@v0.1.1 --process-dependency-links
pip install git+ssh://git@github.com/dattalab/moseq2-viz.git@v0.1.1
pip install git+ssh://git@github.com/dattalab/moseq2-batch.git@v0.1.1

git config --global user.email "markowitzmeister@gmail.com"
git config --global user.name "Jeffrey Markowitz"
