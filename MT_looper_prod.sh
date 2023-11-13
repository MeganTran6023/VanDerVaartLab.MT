#!/bin/bash

#my own mimic of shell script I was responsible for regarding XTUY
#production allows for preparation of DNA for simulation

#MT - currect directory as working directory, initialize DNA bases and directory names
projectDir=$(pwd)
bases="C T A G"
dir_names=$1

#MT- check to see if user input is empty for file name. If empty or invalid, shell scipt disrupted
if [ -z "$dir_names" ]
then
    echo "Error: dir_names variable is empty"
    echo "Supply one of this as the argument to this script: XUCY, XTUY or XCUY"
    exit 1
fi
count=0

# This function handles copying of files, invoking other scripts, and logging jobs submitted.
function manage_files {
    local sq=$1
    local subd=$2

    # Change to the production directory for the current subd.
    cd prod/$subd

    # Remove any existing slurm files.
    #rm -f slurm*
    
    # Define a base path for the data directory to avoid repeated long paths.
    local base_path="$projectDir/$dir/${x}${bb}${y}/heat/$subd"

    # Copy necessary files to the current directory.
    cp $projectDir/npt.py .
    cp $projectDir/gpujob.sh .
    cp $projectDir/gpujob.template .
    cp $projectDir/center_desol_merge.temp .
    cp $projectDir/analy.sh .
    cp $projectDir/eof.temp .
    cp $projectDir/vacgethbondcom.py .

    cp "$base_path/dna-${sq}-$subd.prmtop" .
    cp "$base_path/noe-${sq}-$subd.rst" .

    #Submit GPU jobs.
    sbatch -J "${x}${bb}${y}-$subd" gpujob.sh "${sq}-$subd" "${x}${bb}${y}-$subd"

    #Submit analysis job with custom range for example 1 -> 5
    #sbatch -J "${x}${bb}${y}-$subd" analy.sh 1 5
    #MT- the ranges determine where file is moved to (vac#-$seq.dcd) in analy.sh

        # Log the job as submitted - bookeeping purposes.
    echo "$dir ${x}${bb}${y}" >> $projectDir/jobsSubmitted${dir}.txt
}
# Iterate over all base combinations.
for x in $bases; do
    for y in $bases; do
        for dir in $dir_names; do
            touch jobsSubmitted${dir}.txt
            # Replace 'U' with 'T' and get the middle two characters.
            bb=${dir/U/T}
            bb=${bb:1:2}
            sq="CGCG${x}${bb}${y}CGCG"
            sq=${sq,,}

            # Try changing to the directory, or print an error and exit.
            #MT- pushd - stack algorithm - makes "$dir/${x}${bb}${y}" as new current directory 
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

            # If the current sequence is not yet in the jobsSubmitted.txt, handle the files.
            #if ! grep -q "${x}${bb}${y}" $projectDir/jobsSubmitted${dir}.txt; then
	    #if grep -q "${x}${bb}${y}" $projectDir/jobheat2${dir}.txt; then
            if [ $count -le 16 ] || ! grep -q "${x}${bb}${y}" $projectDir/jobsSubmitted${dir}.txt; then 
		# Increment count.
		((count++))

        #essentially above code evaluates if on job number less then or equal to the 16th job or (||) file is not in form of "${x}${bb}${y}", shell script will quietly quit running
		for subd in minor major; do
		    # If count exceeds 16, exit the script.
                    if [[ "$count" -gt 16 ]]; then
                        exit 0
                    fi

                    manage_files $sq $subd
                    popd
                    pushd "$dir/${x}${bb}${y}" || { echo "Failed to change directory to $dir"; exit 1; }
                    #MT - changes from current directory to $dir/${x}${bb}${y} - stack data structure
                done
            fi

            # Return to the project directory.
            echo "Return to the project directory."
	    popd #return to directory previously was in from above pushd command like an undo button
        done
    done
done