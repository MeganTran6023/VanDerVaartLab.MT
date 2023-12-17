#!/bin/bash

#Input minor sequence
SEQ_upper=$1
SEQ_lower="${SEQ_upper,,}"
export SEQ_lower
dir="${SEQ_upper}/prod/minor"

#For trajin

#for num in 2 1; do
 #       file="vac${num}-cgcg${SEQ_lower}cgcg-major.dcd"

  #      if test -e "$file"; then
   #             echo "Found $file, setting num to $num"
    #            export num
     #           break
      #  fi
#done


#Make cpptraj script for rmsd analysis
cat <<-EOF > rmsd_analy_minor_${SEQ_upper}

#this is for major

parm ${SEQ_upper}/prod/minor/vac_cgcg${SEQ_lower}cgcg-minor.prmtop
reference ${SEQ_upper}/ref_vac/vac-cgcg${SEQ_lower}cgcg-minor.nc

#i will edit the vac number manually
trajin ${SEQ_upper}/prod/minor/vac2-cgcg${SEQ_lower}cgcg-minor.dcd


rmsd :2-5,20-23&!@H reference out block1rmsd_minor.txt mass
rmsd :9-11,14-16&!@H reference out block2rmsd_minor.txt mass
go

EOF

chmod +x rmsd_analy_minor_${SEQ_upper}

input necessary module - has cpptraj
module purge
module load apps/amber/18-19

#runs cpptraj script 
cpptraj -i rmsd_analy_minor_${SEQ_upper}

#move cpptraj script
mv rmsd_analy_minor_${SEQ_upper} $SEQ_upper

#move .txt mass files into respective directories
mkdir minor_rmsd
mv block1rmsd_minor.txt block2rmsd_minor.txt minor_rmsd
mv minor_rmsd $SEQ_upper
