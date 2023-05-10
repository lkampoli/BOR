#!/bin/bash

#SBATCH --job-name="post"
#SBATCH --time=00:30:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mail-type=ALL
#SBATCH --mail-user=lorenzo.campoli@unimelb.edu.au

#SBATCH --account punim0394
#SBATCH -p physical
#SBATCH --cpus-per-task=1
#SBATCH --mem=16G

module load gnuplot/5.4.1

source /usr/local/module/spartan_old.sh
module load OpenFOAM/2.4.0-intel-2017.u2
source $FOAM_BASH

mpiexec -n 1 reconstructPar 2>&1 | tee -a log.reconstructPar
