#!/bin/bash

##Slurm directives
#SBATCH -t 48:00:00 #job takes 48 hrs to run
##SBATCH --partition=snsm_itn19 --qos=amd_2021 #partitions = diff places to run simulation in that do dif things; qos = quality of service, prioritize certain jobs for ease of access to resources
#SBATCH --partition=amd_2021
##SBATCH --partition=circe
#SBATCH -N 1 --ntasks-per-node=20 #run 20 jobs in 1 part of computer
#SBATCH --mem-per-cpu=512MB # amount memory to use

module purge # empties any modules previously in system
module load apps/amber/18-19
export LD_LIBRARY_PATH=/usr/lib64/psm2-compat:$LD_LIBRARY_PATH #path to find other resources for script

system="$1"
name=$2
dir=$3

#cpptraj script 
mpirun -np $SLURM_NTASKS -ppn $SLURM_NTASKS_PER_NODE sander.MPI -O -i heat1.in -o heat150-$system.out -p dna-$system.prmtop -c mini2-$system.ncrst -r heat150-$system.rst -x heat150-$system.mdcrd -inf heat150-$system.mdinfo -ref mini2-$system.ncrst

mpirun -np $SLURM_NTASKS -ppn $SLURM_NTASKS_PER_NODE sander.MPI -O -i heat2.in -o heat-300-$system.out -p dna-$system.prmtop -c heat150-$system.rst -r heat-300-$system.rst -x heat-300-$system.mdcrd -inf heat-300-$system.mdinfo -ref mini2-$system.ncrst

sbatch -J n$name $dir/eq.sh $system $name $dir #run jobs specified by script eq.sh


#secript of cpptraj script
#1) -np $SLURM_NTASKS
#how many tasks to run simultaneously

#2) -ppn $SLURM_NTASKS_PER_NODE
#number of tasks to run per a part of computer system

#3) -O
# optimization

#4) -c = coordinate file
## establishes initial state of molecular system

#5) -x = trajectory file (saves over time)
## records positions of atoms of molecule at each time of simulation. used to compare to ref file

#6) -inf = information file (info about simulation run)

#7) -ref what we compare our simulated system to
