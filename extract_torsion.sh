#!/bin/bash

# Set the current working directory as the project directory
path=$(pwd)
base_path="/work/m/megantran"
torsion_names="delta zeta beta alpha gamma epsilon chi"

# List all subdirectories in the base directory - run in GC_XTUY - work directory - these are register shifted of interest
subdirectories_major=("GTCC" "CTCT" "GTCT" "TTCC" "CTCC" "TTCT" "ATCT")
subdirectories_minor=("CTCT" "ATCT")

for item in $torsion_names; do
    mkdir "${item}_torsion"
done

# Loop through each subdirectory for majors, find torsion dat files for each greek name 
for sub_dir in "${subdirectories_major[@]}"; do
    for item in $torsion_names; do
        # Enter into directory
        subdir_path="$sub_dir/prod/major/an/backbone/torsion/"
        cd "$subdir_path" || exit
        # Get respective .dat files - each greek letter own file
        echo "$item"*.dat
        cp "$item"*.dat "$base_path"/XTUY_GC/XTUY/"${item}_torsion"
        cd "$path" || exit
    done
done

# Loop through each subdirectory for minors, find torsion dat files for each greek name 
for sub_dir in "${subdirectories_minor[@]}"; do
    for item in $torsion_names; do
        # Enter into directory
        subdir_path="$sub_dir/prod/minor/an/backbone/torsion/"
        cd "$subdir_path" || exit
        # Get respective .dat files - each greek letter own file
        echo "$item"*.dat has been transferred into "${item}_torsion"
        cp "$item"*.dat "$base_path"/XTUY_GC/XTUY/"${item}_torsion"
        cd "$path" || exit
    done
done
