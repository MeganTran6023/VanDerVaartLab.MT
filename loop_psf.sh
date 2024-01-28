#!/bin/bash

# Set the current working directory as the project directory
projectDir=$(pwd)

# Specify the base directory containing subdirectories
base_dir=$1

# List all subdirectories in the base directory
subdirectories=($(find "$base_dir" -maxdepth 1 -type d -not -name "$base_dir"))


# Loop through each subdirectory
for sub_dir in "${subdirectories[@]}"; do

        # Construct the absolute path to the subdirectory
        sub_dir_path="$projectDir/$sub_dir/prod"

        # Enter into the subdirectory, copy files from home to current directory
        cd "$sub_dir_path" || { echo "Could not change directory to $sub_dir_path"; exit 1; }
        cp /work_bgfs/m/megantran/uridine_flip/GC_XTUY/psf2.sh .
        cp /work_bgfs/m/megantran/uridine_flip/GC_XTUY/looper_analysis_psf.sh .

        cp /work_bgfs/m/megantran/uridine_flip/GC_XTUY/create_psf.py .

        cp /work_bgfs/m/megantran/uridine_flip/GC_XTUY/continueXTUY.txt .

        cp /work_bgfs/m/megantran/uridine_flip/GC_XTUY/BPS.template .

        cp /work_bgfs/m/megantran/uridine_flip/GC_XTUY/looper_analysis_continue.sh .

        cp /work_bgfs/m/megantran/uridine_flip/GC_XTUY/analy_continue.sh .

        #run looper_analysis to run other files
#       ./looper_analysis.sh XTUY
        # Return to the original directory
        cd "$projectDir"
done
