#!/bin/bash

# Set the current working directory as project directory and initialize bases and directory names.
projectDir=$(pwd)
bases="C T A G"
dir_names=$1

if [ -z "$dir_names" ]
then
    echo "Error: dir_names variable is empty"
    echo "Supply one of this as the argument to this script: XUCY, XTUY or XCUY"
    exit 1
fi

# This function handles copying of files, invoking other scripts, and logging jobs submitted.
function manage_files {
    local sq=$1
    local subd=$2

    # Change to the heat directory for the current subd.
    cd "heat/$subd"

    # Remove any existing slurm files.
    #rm -f slurm*
    rm -f core*

    # Define a base path for the data directory to avoid repeated long paths.
    local base_path="$projectDir/$dir/${x}${bb}${y}/build/data/$subd"

    # Copy necessary files to the current directory. #MT -No need to manually get these files from dif directory
    #cp $projectDir/heat1.in .
    #cp "$base_path/dna-${sq}-$subd.inpcrd" .
    #cp "$base_path/dna-${sq}-$subd.prmtop" .
    #cp "$base_path/mini2-${sq}-$subd.ncrst" .
    #cp $base_path/*.RST .

    # Execute additional scripts.
    #$projectDir/make_heat.sh "${sq}-$subd"
    #$projectDir/make_eq.sh "${sq}-$subd"
    #$projectDir/make_noe.sh "${sq}-$subd"
    #####$projectDir/submitByDependency.sh "${sq}-$subd" "${x}${bb}${y}${subd:0:2}" "$projectDir" #MT - submit additional jobs

    if grep -q "${x}${bb}${y}${subd:0:2}" $projectDir/running.txt; then
        #echo "running ${x}${bb}${y}${subd:0:2}"
        sbatch -J "${x}${bb}${y}${subd:0:2}" $projectDir/heat.sh "${sq}-$subd" "${x}${bb}${y}${subd:0:2}" "$projectDir"
    else
        echo "${x}${bb}${y}${subd:0:2} finished/ failed"
    fi
    # Log the job as submitted.
    #echo "$dir ${x}${bb}${y}" >> $projectDir/jobsSubmitted${dir}.txt
}

# Iterate over all base combinations.
for x in $bases; do
    for y in $bases; do
        for dir in $dir_names; do
            touch jobsSubmitted${dir}.txt
            # Replace 'U' with 'T' and get the middle two characters.
            bb=${dir/U/T} #MT - if I want a new sequence, I edit this. for XTUY, the U in uraid is 7
            bb=${bb:1:2}
            sq="CGCG${x}${bb}${y}CGCG"
            sq=${sq,,}

            # Try changing to the directory, or print an error and exit.
            pushd "$dir/${x}${bb}${y}" || { echo "Failed to change directory to $dir"; exit 1; }

            # Default settings for uraID and com.
            uraID=7
            com="$y"
            com="${com,,}"

            # Special handling for directory XUCY.
            if [ "$dir" == "XUCY" ]; then
                uraID=6
                com="c"
            fi

            for subd in minor major; do

                manage_files $sq $subd
                popd
                pushd "$dir/${x}${bb}${y}" || { echo "Failed to change directory to $dir"; exit 1; }

            done
            # Return to the project directory.
            popd
        done
    done
done
