#MT 9/11 - code from a previous graduate student in lab for the heating parameter

#MT 9/11 - will annotate soon

#!/bin/bash
#SBATCH -t 48:00:00
#SBATCH --partition=mri2016
#SBATCH --qos=mri16
#SBATCH -N 1 --ntasks-per-node=18


module purge
module load apps/amber/18-19


system="$1"

mpirun -np $SLURM_NTASKS -ppn $SLURM_NTASKS_PER_NODE sander.MPI -O -i heating1.in -o heat150-$system.out -p dna-$system.prmtop -c mini2-$system.ncrst -r heat150-$system.rst -x heat150-$system.mdcrd -inf heat150-$system.mdinfo -ref mini2-$system.ncrst
