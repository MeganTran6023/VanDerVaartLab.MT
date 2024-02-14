#!/bin/bash

# Set the current working directory as the project directory

subd="in aj"

base_path="/work/m/megantran"

torsion_names="delta zeta beta alpha gamma epsilon chi"


# List all subdirectories in the base directory - run in GC_XTUY - work directory - these are register shifted of interest
subdirectories_major=("GTCC CTCT GTCT TTCC CTCC TTCT ATCT" )
subdirectories_minor=("CTCT ATCT")


for item in $torsion_names; do
    mkdir "$item"_torsion
done


# Loop through each subdirectory, find torsion dat files for each greek name 
for sub_dir in "${subdirectories[@]}"; do
        for dir in $subd; do
            for item in $torsion_names; do

                #enter in directory
                 subdir_path="$sub_dir/prod/$dir/an/backbone/torsion/"
                 cd $subdir_path
                #get respective .dat files - each greeek letter own file
                 cp $item*.dat "$base_path"/XTUY_GC/XTUY/"$item_torsion"

                 done
        done
done

                 

                
