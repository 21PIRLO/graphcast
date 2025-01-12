#!/bin/bash

# Download and install Miniconda
echo "Downloading Miniconda..."
curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh  # On Linux
bash miniconda.sh -b -p $HOME/miniconda
rm miniconda.sh

# Initialize conda
echo "Initializing conda..."
# source $HOME/miniconda/etc/profile.d/conda.sh
source $HOME/miniconda/bin/activate
conda init bash
conda config --set auto_activate_base False
source ~/.bashrc

# Create virtual environment
echo "Creating graphcast environment..."
conda create -n graphcast -y python=3.11 pip=23.2.1

# Activate environment and install requirements
echo "Installing requirements..."
conda activate graphcast
pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple

echo "Setup complete! Graphcast environment is ready."
echo "To activate the environment, run: conda activate graphcast"
