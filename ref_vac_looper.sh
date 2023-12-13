#this will 
# 1-run both file conversion scripts
# 2-make directory
# 3- store major and minor vac ref files in directory

#!/bin/bash

#List out directores to loop through
directories=($(find . -maxdepth 1 -type d -not -name 'XTUY' -not -name 'TTTT' -printf '%f\n'))

#Loop through each directory
for i in "${directories[@]}"; do
        cd "$i" || { echo "Could not change directory to $i"; exit 1; }

# Run the cpptraj scripts

        cpptraj -i rmsd.cpptraj_fileconversion
        cpptraj -i rmsd.cpptraj_minor_fileconversion

#make new directory to store vac files
        mkdir ref_vac

# move vac files into directory
        mv *vac* ref_vac
        #Return to original directory
        cd -
done
