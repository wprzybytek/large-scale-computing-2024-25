#!/bin/bash

# Usage: bash jupyter.sh [PYTHON_VERSION]
# Example: bash jupyter.sh 3.11.8

PYTHON_VERSION="${1:-3.11.7}"
ENV_NAME="python_env_$PYTHON_VERSION"

module load miniconda3
eval "$(conda shell.bash hook)"

conda create -n "$ENV_NAME" python="$PYTHON_VERSION"
conda activate "$ENV_NAME"

conda install git pip jupyter pandas=1.5.3
pip install git+https://github.com/NERSC/slurm-magic.git
