# Jupyter notebook with a cluster backend

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
    conda install git pip ipykernel pandas=1.5.3
    pip install git+https://github.com/NERSC/slurm-magic.git
    ```
4. Register environment as a kernel in JupyterLab:
    ```bash
    python -m ipykernel install --user --name "<kernel_name>" --display-name "<kernel_display_name>" --env PYTHONPATH ""
    ```
5. Run the jupyter notebook (*do it on the login node*)
   ```bash
   jupyter notebook
   ```
6. Create a new terminal window and run following command
   ```bash
   ssh -NL localhost:8888:localhost:8888 <plgrid username>@ares.cyfronet.pl
   ```

7. Copy the link for the notebook from the terminal and paste it into your browser.