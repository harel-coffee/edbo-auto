#!/bin/bash

################################################# Create conda environment

echo "Creating conda environment..."

conda create --name edbo python=3.7.5

# get into environment
eval "$(conda shell.bash hook)"
conda activate edbo

################################################# Clone edbo

echo "Cloning source..."

git clone https://github.com/b-shields/edbo.git

cd edbo

################################################# Install some dependencies

echo "#########################################"
echo "Installing dependencies..."
echo "-----------------------------------------"
echo "Respond 'y' to each prompt to proceed"
echo "#########################################"

conda install -c rdkit rdkit
conda install pandas=0.25.3 numpy=1.17.4 pytorch=1.3.1 
conda install scikit-learn=0.22.1 
conda install matplotlib seaborn

pip install gpytorch==1.0.0 pyclustering==0.9.3.1

################################################# Install package namespace

echo "Installing edbo..."

python setup.py develop

################################################# Install an editor

conda install jupyterlab

#################################################

echo "Installation complete!"