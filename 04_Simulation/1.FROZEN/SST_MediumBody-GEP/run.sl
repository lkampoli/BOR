#!/bin/bash

#SBATCH --job-name="GEP"
#SBATCH --partition=physical
#SBATCH --ntasks-per-node=10
#SBATCH --nodes=1
#SBATCH --time=24:00:00
#SBATCH --export=NONE
#SBATCH --mail-type=ALL
#SBATCH --mail-user=lorenzo.campoli@unimelb.edu.au
#SBATCH --mem=16GB

module purge
##module swap PrgEnv-cray PrgEnv-gnu
source /usr/local/module/spartan_old.sh
module load OpenFOAM/2.4.0-intel-2017.u2
##module load gnuplot/5.4.1
##module load openfoam/8
##module load openfoam/7
##module load openfoam/6
source $FOAM_BASH

srun --export=all -n 10 simpleFoam -parallel 2>&1 | tee -a log.simpleFoam

###SBATCH --job-name="BOR2DSteadyRANS_Large"
###SBATCH --time=24:00:00
###SBATCH --nodes=1
###SBATCH --ntasks-per-node=10
###SBATCH --mail-type=ALL
###SBATCH --mail-user=lorenzo.campoli@unimelb.edu.au
##
###SBATCH --account punim0394
###SBATCH -p physical
###SBATCH --cpus-per-task=1
###SBATCH --mem=16G
##
##module purge all
##module load gnuplot/5.4.1
##
##source /usr/local/module/spartan_old.sh
##module load OpenFOAM/2.4.0-intel-2017.u2
##source $FOAM_BASH
##
### mpiexec -n 1  blockMesh 2>&1              | tee -a log.blockMesh
### mpiexec -n 1  checkMesh 2>&1              | tee -a log.checkMesh
### mpiexec -n 1  decomposePar -cellDist 2>&1 | tee -a log.decomposePar
### mpiexec -n 10   potentialFoam -writep -parallel 2>&1 | tee -a log.potentialFoam
##mpiexec -n 10   simpleFoam -parallel 2>&1   | tee -a log.simpleFoam
### mpiexec -n 1  reconstructPar 2>&1 	  | tee -a log.reconstructPar
