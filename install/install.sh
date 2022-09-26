#!/bin/bash

# Update package list
apt-get update

# Install conda
apt-get install -y wget
if [[ ! -d "/root/miniconda3" ]]
then
    miniconda_name="Miniconda3-latest-Linux-x86_64.sh"
    wget https://repo.anaconda.com/miniconda/$miniconda_name
    chmod u+x $miniconda_name
    ./$miniconda_name -b
    rm $miniconda_name
fi

# Install Python packages
export PATH=$PATH:~/miniconda3/bin
conda create -n "geom" python=3.9 pip
conda run --no-capture-output -n geom pip install torch==1.10.2+cu113 torchvision==0.11.3+cu113 torchaudio==0.10.2+cu113 -f https://download.pytorch.org/whl/cu113/torch_stable.html
conda run --no-capture-output -n geom pip install tensorboardX==1.6
pip  uninstall protobuf #comes with smth above, but the default is too new
conda run --no-capture-output -n geom pip install tqdm numpy protobuf==3.20
conda init bash

# Add to conda to .bashrc
echo "conda activate geom" >> ~/.bashrc
