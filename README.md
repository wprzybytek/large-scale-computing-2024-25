# Jupyter notebook with a cluster backend

## Installation

### Installation using `install.sh` script

1. Copy the `install.sh` to the cluster using `scp`
2. Set the permissions:
    ```bash
    chmod u+x install.sh
    ```
3. Run the script, optionally providing the python version (default is 3.11.7):
    ```bash
    ./install.sh [python_version]
    ```

### Manual installation

1. Log onto the cluster and load `conda` module:
    ```bash
    module load miniconda3
    eval "$(conda shell.bash hook)"
    ```
2. Create a new environment:
    ```bash
    conda create -n <env_name> python=<python_version>
    conda activate <env_name>
    ```
3. Install required packages:
    ```bash
    conda install git pip jupyter pandas=1.5.3
    pip install git+https://github.com/NERSC/slurm-magic.git
    ```

## Starting the Notebook Server

1. Start the jupyter notebook server (*do it on the login node*)
   ```bash
   module load miniconda3
   eval "$(conda shell.bash hook)"
   conda activate <env_name> # if ./install.sh was used, <env_name> is python_env_3.11.7
   jupyter notebook
   ```
2. Check the output of the previous command for the port number (`<cluster_port>`) and run the following command on your local machine:
   ```bash
   ssh -NL localhost:<local_port>:localhost:<cluster_port> <plgrid username>@ares.cyfronet.pl
   ```

3. Copy the link for the notebook from the terminal and paste it into your browser. If the `local_port` in the previous step was different from `cluster_port` you need to change the port number in the link.