#!/bin/bash

#SBATCH --job-name="BOR2DSteadyRANS_Large"
#SBATCH --time=00:30:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mail-type=ALL
#SBATCH --mail-user=lorenzo.campoli@unimelb.edu.au

#SBATCH --account punim0394
#SBATCH -p physical
#SBATCH --cpus-per-task=1
#SBATCH --mem=16G

module load OpenFOAM/6.0-intel-2017.u2
mpiexec -n 1 blockMesh 2>&1              | tee -a log.blockMesh
mpiexec -n 1 checkMesh 2>&1              | tee -a log.checkMesh
source $FOAM_BASH

module purge
module load OpenFOAM/2.3.1-spartan_intel-2017.u2
source $FOAM_BASH

mpiexec -n 1 decomposePar -cellDist 2>&1 | tee -a log.decomposePar
