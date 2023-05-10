#!/bin/bash

#SBATCH --job-name="BSL_g2"
#SBATCH --partition=physical
#SBATCH --ntasks-per-node=10
#SBATCH --nodes=1
#SBATCH --time=48:00:00
#SBATCH --export=NONE
#SBATCH --mail-type=ALL
#SBATCH --mail-user=lorenzo.campoli@unimelb.edu.au

module purge
module load gnuplot/5.4.1
module load openfoam/8
source $FOAM_BASH

srun --export=all -n 10 simpleFoam -parallel 2>&1 | tee -a log.simpleFoam

# cp -r 0_orig 0
# blockMesh 2>&1 | tee -a log.blockMesh
# checkMesh 2>&1 | tee -a log.checkMesh
# decomposePar -cellDist 2>&1 | tee -a log.decomposePar
# mpirun -np 10 potentialFoam -writep -parallel 2>&1 | tee -a log.potentialFoam
# mpirun -np 10 simpleFoam -parallel 2>&1 | tee -a log.simpleFoam
# reconstructPar -latestTime 2>&1 | tee -a log.reconstructPar

# srun decomposePar -force -time '291000' -cellDist 2>&1 | tee -a log.decomposePar
# srun -n 10 simpleFoam 		            -parallel 2>&1 | tee -a log.simpleFoam
# reconstructPar                      -latestTime 2>&1 | tee -a log.reconstructPar

# srun --export=all -n 1 blockMesh
# srun --export=all -n 1 surfaceFeatureExtract
# srun --export=all -n 1 decomposePar
# srun --export=all -n 12  snappyHexMesh  -parallel -overwrite
# srun --export=all -n 1 reconstructParMesh -constant
# srun --export=all -n 1 transformPoints -scale '(5.34919548e-03  5.34919548e-03  5.34919548e-03)'
# srun --export=all -n 1 checkMesh
# srun --export=all -n 1 decomposePar -time '8000'
# srun --export=all -n 480 simpleFoam -parallel
# srun --export=all -n 1 reconstructPar
# srun --export=all -n 1 R
# srun --export=all -n 1 wallGradU
# srun --export=all -n 1 yPlusRAS -latestTime
# srun --export=all -n 960 sample -parallel -latestTime

##DO NOT ADD/EDIT BEYOND THIS LINE## ##Job monitor command to list the resource usage 
my-job-stats -a -n -s
