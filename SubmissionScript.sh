#!/bin/bash

#This will be a script to submit my DNA sequence for preprocessing

#!/bin/bash
#SBATCH -t 48:00:00
#SBATCH --partition=amd_2021
#SBATCH -N 1 --ntasks-per-node=18
#SBATCH --mem=32G  

module purge
module load apps/openmm/6.1

irun=$1
sq=$2

./npt.py "$irun" "$sq"
