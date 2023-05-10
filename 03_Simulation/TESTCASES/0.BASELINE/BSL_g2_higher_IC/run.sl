#!/bin/bash

#SBATCH --job-name="BSL_g2_IC"
#SBATCH --partition=physical
#SBATCH --ntasks-per-node=10
#SBATCH --nodes=1
#SBATCH --time=01:00:00
#SBATCH --export=NONE
#SBATCH --mail-type=ALL
#SBATCH --mail-user=lorenzo.campoli@unimelb.edu.au
#SBATCH --mem=4GB

module purge
module load gnuplot/5.4.1
module load openfoam/8
source $FOAM_BASH

decomposePar -latestTime 2>&1 | tee -a log.decomposePar
srun --export=all -n 10 simpleFoam -parallel 2>&1 | tee -a log.simpleFoam
reconstructPar -latestTime 2>&1 | tee -a log.reconstructPar

##DO NOT ADD/EDIT BEYOND THIS LINE## ##Job monitor command to list the resource usage 
my-job-stats -a -n -s
