#!/bin/bash

# Define the script you want to run on .pdb files
script_to_run="./convertRESname.sh"

# List of directories containing .pdb files
directories=("XCUY" "XTUY" "XUCY")

# Loop through each directory
for dir in "${directories[@]}"; do
    # Check if the directory exists
    if [ -d "$dir" ]; then
        echo "Processing files in $dir directory..."
        
        # Create an output directory within the source directory
        output_dir="$dir/DNAsplit_output"
        mkdir -p "$output_dir"
        
        # Loop through .pdb files in the directory and execute the script
        for pdb_file in "$dir"/*.pdb; do
            if [ -f "$pdb_file" ]; then
                echo "Running script on $pdb_file..."
                # Execute your script on the .pdb file
                # Store the output in the output directory
                "$script_to_run" "$pdb_file" > "$output_dir/$(basename "$pdb_file").output"
            fi
        done
    else
        echo "Directory $dir does not exist."
    fi
done
