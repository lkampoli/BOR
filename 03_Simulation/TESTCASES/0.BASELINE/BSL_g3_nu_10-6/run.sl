#!/bin/bash

#SBATCH --job-name="BSL_g3_nu_10-6"
#SBATCH --partition=physical
#SBATCH --ntasks-per-node=1
#SBATCH --nodes=1
#SBATCH --time=24:00:00
#SBATCH --export=NONE
#SBATCH --mail-type=ALL
#SBATCH --mail-user=lorenzo.campoli@unimelb.edu.au

module purge
module load openfoam/8
source $FOAM_BASH

srun --export=all simpleFoam 2>&1 | tee -a log.simpleFoam
##srun --export=all -n 10 simpleFoam -parallel 2>&1 | tee -a log.simpleFoam

##DO NOT ADD/EDIT BEYOND THIS LINE## ##Job monitor command to list the resource usage 
my-job-stats -a -n -s
