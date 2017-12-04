#!/bin/sh
#SBATCH -t 2:00:00  # run for 2 hour max
#SBATCH -n 1        # we only need one core
make singularity
