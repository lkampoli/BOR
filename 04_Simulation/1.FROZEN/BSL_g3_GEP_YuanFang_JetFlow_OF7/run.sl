#!/bin/bash

#SBATCH --job-name="BSL_g3_GEP_YuanFang_JetFlow"
#SBATCH --partition=physical
#SBATCH --ntasks-per-node=10
#SBATCH --nodes=1
#SBATCH --time=00:30:00
#SBATCH --export=NONE
#SBATCH --mail-type=ALL
#SBATCH --mail-user=lorenzo.campoli@unimelb.edu.au
#SBATCH --mem=16GB

module purge
module load gnuplot/5.4.1
module load openfoam/7
source $FOAM_BASH

srun --export=all -n 10 simpleFoam -parallel 2>&1 | tee -a log.simpleFoam
reconstructPar -latestTime 2>&1 | tee -a log.reconstructPar

##DO NOT ADD/EDIT BEYOND THIS LINE## ##Job monitor command to list the resource usage 
my-job-stats -a -n -s
