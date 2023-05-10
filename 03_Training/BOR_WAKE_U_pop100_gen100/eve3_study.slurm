#!/bin/bash

#SBATCH --job-name="BOR_WAKE_U"
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=7-00:00:00

module load gcccore/10.2.0 python/3.8.6
source ~/virtualenv/python3.8.6/bin/activate

echo "Running"
python ./eve3_study.py
