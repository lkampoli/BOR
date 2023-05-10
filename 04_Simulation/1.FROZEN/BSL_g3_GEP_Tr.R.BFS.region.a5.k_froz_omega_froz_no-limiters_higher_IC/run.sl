#!/bin/bash

#SBATCH --job-name="BSL_g3_GEP_Tr.R.BFS.region.a5.k_froz_omega_froz_no-limiters_higher_IC"
#SBATCH --partition=physical
#SBATCH --ntasks-per-node=10
#SBATCH --nodes=1
#SBATCH --time=00:30:00
#SBATCH --export=NONE
#SBATCH --mail-type=ALL
#SBATCH --mail-user=lorenzo.campoli@unimelb.edu.au
#SBATCH --mem=4GB

module purge
module load gnuplot/5.4.1
module load openfoam/7
source $FOAM_BASH

decomposePar -force -latestTime 2>&1 | tee -a log.decomposePar
srun --export=all -n 10 simpleFoam -parallel 2>&1 | tee -a log.simpleFoam
reconstructPar -latestTime 2>&1 | tee -a log.reconstructPar

##DO NOT ADD/EDIT BEYOND THIS LINE## ##Job monitor command to list the resource usage 
my-job-stats -a -n -s
