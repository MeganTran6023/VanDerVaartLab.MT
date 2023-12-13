#!/bin/bash

#List out directores to loop through
directories=($(find . -maxdepth 1 -type d -not -name 'XTUY' -printf '%f\n')) 

#Loop through each directory
for i in "${directories[@]}"; do
	cd "$i" || { echo "Could not change directory to $i"; exit 1; }

	#make a rmsd cpptraj file in each directory
	cat <<EOF > rmsd.cpptraj_fileconversion
#RMSD cpptraj file conversion
parm dna-$seq.prmtop
trajin mini2-$seq.ncrst
strip (:WAT)
trajout vac-$seq.nc
go
EOF

	#Make script executable
	chmod +x rmsd.cpptraj_fileconversion

	#Return to original directory
	cd -
done
