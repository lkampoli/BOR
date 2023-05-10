#!/bin/bash
#SBATCH --job-name="reynolds_stress_wall_shear_stress_I1_I2_ME_C1_16_200"
#SBATCH --partition=physical
#SBATCH --nodes=1
#SBATCH --ntasks=8
#SBATCH --time=2-00:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=lorenzo.campoli@unimelb.edu.au

# Load required modules
module load openfoam/7
source $FOAM_BASH

module unload python/3.7.4

export PYTHONPATH=""

module load anaconda3/2021.11
eval "$(conda shell.bash hook)"
#conda activate eve4bor
conda activate BOR_in_the_loop

# Launch multiple process python code
echo "Running"
python ./eve3_study.py
