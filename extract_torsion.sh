#!/bin/bash

# Set the current working directory as the project directory
projectDir=$(pwd)

base_dir=$1

subd="in aj"

base_path="/work/m/megantran"


torsion_names="delta zeta beta alpha gamma epsilon chi"

# Verify User input
if [ -z "$base_dir" ]; then
    echo "Error: dir_names variable is empty"
    echo "Supply one of these as the argument to this script: XTUY, XCUY, or XUCY"
    exit 1
fi

# List all subdirectories in the base directory - run in GC_XTUY - work directory
subdirectories=($(find "$base_dir" -maxdepth 1 -type d -not -name "$base_dir"))


# Loop through each subdirectory, find torsion dat files for each greek name 
for sub_dir in "${subdirectories[@]}"; do
        for dir in $subd; do
            for item in $torsion_names; do

                #enter in directory
                 subdir_path="$sub_dir/prod/$dir/an/backbone/torsion/"
                 cd $subdir_path
                #get respective .dat files
                 cp $item*.dat

                 

                
