#!/bin/bash
pwd=$(pwd)
base_dir=$1
major_minor=("major" "minor")

#Verify User input
if [ -z "$base_dir" ]
then
    echo "Error: base_dir variable is empty"
    echo "Supply one of this as the argument to this script: XUCY, XTUY or XCUY"
    exit 1
fi
count=0

#Make directory to put Hbond and Com
mkdir GC_Hbond_Com

# List all subdirectories in the base directory
subdirectories=($(find "$base_dir" -maxdepth 1 -type d -not -name "$base_dir"))

# Loop through each subdirectory
for sub_dir in "${subdirectories[@]}"; do
#only seq name XXXX not whole path XTUY/XXXX
    dir_name=$(basename "$sub_dir")
#loop through major and minor
    for major_minor_subd in "${major_minor[@]}"; do
    # Construct the absolute path to the subdirectory
        sub_dir_path="$sub_dir/prod/$major_minor_subd"

    # Enter into the subdirectory
        cd "$sub_dir_path" || { echo "Could not change directory to $sub_dir_path"; exit 1; }

    #Copy center of mass and Hbonds files
        cp Com-${dir_name}-${major_minor_subd}.png Com-${dir_name}-${major_minor_subd}_COPY.png
        cp Hbonds-${dir_name}-${major_minor_subd}.png Hbonds-${dir_name}-${major_minor_subd}_COPY.png
        echo "Copied Com and Hbond files."

     #Move files above into new directory made in GC_XTUY
         mv Com-${dir_name}-${major_minor_subd}_COPY.png $pwd/GC_Hbond_Com
         mv Hbonds-${dir_name}-${major_minor_subd}_COPY.png $pwd/GC_Hbond_Com

     # Return to the original directory
         cd "$pwd" || exit
     echo "Moved files into GC_Hbond_Com"
    done
done
