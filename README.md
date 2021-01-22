# Docker images:

This repository is responsible to hold all scripts to build the ringer image.

## How to use ringer base image?

Let's use singularity as core to instantiate the image:

```bash
singularity pull docker://jodafons/ringer:base
```

After donwload it, just execute the `run` command:
```bash
singularity run --nv ringer_base.sif
```

**NOTE**: The argument `--nv` is responsible to attach the gpu into the container if you have it.

Inside of the singularity enviroment, just setup all prometheus dependencies using:

```bash
source /setup_all_here.sh ringer-atlas
```


## How to use ringer Jupyter image?

This tag has inheritance from ringer base.

```bash
singularity pull docker://jodafons/ringer:jupyter
```

After donwload it, just execute the `run` command:

```bash
singularity run --nv ringer_jupyter.sif
```
The jupyter server will starts automatically. 

### Port foward to LPS:

Sometimes, it's commom to execute this image inside of the 
cluster infrastruture. To make the port foward just use these commands:

```bash
ssh -L localhost:8888:localhost:8888 jodafons@login.lps.ufrj.br
```

And inside of login machine:
```bash
ssh -L localhost:8888:localhost:8888 caloba21
```

**NOTE** Using caloba cluster and port 8888 as example.

