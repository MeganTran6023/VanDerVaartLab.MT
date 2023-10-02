#!/bin/bash

#reference script: xexecorosive
#This will be a script to submit my DNA sequence for preprocessing

#!/bin/bash
#SBATCH -t 48:00:00
#SBATCH --partition=amd_2021
#SBATCH -N 1 --ntasks-per-node=18
#SBATCH --mem=32G  

#10/3 MT - load necessary modules
module purge 
module load apps/openmm/6.1

#10/3 MT -assign variables to submit a DNA sequence for preprocessing (Minimization, solvation, heat, etc)
irun=$1
sq=$2

#10/3 MT - executing a specific file with necessary variables defined
./npt.py "$irun" "$sq"
