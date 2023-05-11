#!/bin/bash

#SBATCH --job-name="Tr.aijx.squCyl.region_Ha5_newfrozenaijxRij_hat.3.eve"
#SBATCH --account=bq2
#SBATCG --partition=workq
#SBATCH --ntasks-per-node=10
#SBATCH --nodes=1
#SBATCH --time=24:00:00
#SBATCH --export=NONE
#SBATCH --mail-type=ALL
#SBATCH --mail-user=lorenzo.campoli@unimelb.edu.au

# module swap PrgEnv-cray PrgEnv-gnu
# module load openfoam/6
 
module swap PrgEnv-cray PrgEnv-gnu
source /group/bq2/OpenFOAM/OpenFOAM-2.4.0/etc/bashrc

# cp -r 0_orig 0
# srun blockMesh 2>&1 | tee -a log.blockMesh
# srun checkMesh 2>&1 | tee -a log.checkMesh
# srun decomposePar -cellDist  -latestTime -force	 2>&1 | tee -a log.decomposePar
# mpirun -np 10 potentialFoam -writep -parallel 2>&1 | tee -a log.potentialFoam
# mpirun -np 10 simpleFoam -parallel 2>&1 | tee -a log.simpleFoam
# reconstructPar -latestTime 2>&1 | tee -a log.reconstructPar

# srun decomposePar -force -cellDist 2>&1 | tee -a log.decomposePar
# srun -n 10 potentialFoam -writep -parallel 2>&1 | tee -a log.potentialFoam
srun --export=all -n 10 simpleFoam -parallel 2>&1 | tee -a log.simpleFoam
# reconstructPar -latestTime 2>&1 | tee -a log.reconstructPar

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
