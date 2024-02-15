#!/bin/bash

# Set the current working directory as the project directory
path=$(pwd)

# Define directories and paths
base_path="/work/m/megantran"
subdirectories_major=("GTCC CTCT GTCT TTCC CTCC TTCT ATCT")
subdirectories_minor=("CTCT ATCT")
torsion_names="delta zeta beta alpha gamma epsilon chi"

# Create directories for each torsion name
for item in $torsion_names; do
    mkdir "${item}_torsion"
done

# Loop through each subdirectory, find torsion dat files for each torsion name
for sub_dir in "${subdirectories_major[@]}"; do
    for dir in ${subdirectories_minor[@]}; do
        for item in $torsion_names; do
            # Enter into the directory
            subdir_path="$sub_dir/prod/$dir/an/backbone/torsion/"
            cd "$subdir_path" || exit

            # List the respective .dat files for each torsion name
            echo "$item"*.dat

            # Copy the .dat files to the specified directory
            cp "$item"*.dat "$base_path/XTUY_GC/XTUY/${item}_torsion"

            # Return to the original directory
            cd "$path" || exit
        done
    done
done
