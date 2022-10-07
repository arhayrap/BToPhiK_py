# From fresh LPC start. If you already have some version of conda/mamba working on LPC, skip this step
```
cd nobackup
curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh"
bash Mambaforge-$(uname)-$(uname -m).sh
```

To install and run the environment:
```
mamba env create -f analysis-env.yml
mamba activate anal
jupyter lab --no-browser --port=[port]
```
# BToPhiK_py
