#!/bin/sh
#SBATCH -t 2:00:00  # run for 2 hour max
#SBATCH -n 1        # we only need one core
module load python
source /nfs/home2/molenaar/spack/share/spack/setup-env.sh
spack load node-js
make run-udocker
