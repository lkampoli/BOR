#!/bin/bash

#SBATCH --job-name="BOR_WAKE_UVRxy_higher_IC"
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=7-00:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=lorenzo.campoli@unimelb.edu.au

module load gcccore/10.2.0 python/3.8.6
source ~/virtualenv/python3.8.6/bin/activate

echo "Running"
python ./eve3_study.py
