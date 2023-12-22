#!/bin/bash

# Specify the base directory
base_directory="/Playground_MT/XUAY"

# Specify the output file
output_file="$base_directory/all_combined_files.txt"

# Create the output file if it doesn't exist
[ -e "$output_file" ] || touch "$output_file"

# Loop through subdirectories in XUAY
for dir in "$base_directory"/; do
    # Find "sample_rmsd.txt" and "sample2_rmsd.txt" files in each subdirectory, remove empty lines, and concatenate them into one file
    find "$dir" -type f \( -name "sample_rmsd.txt" -o -name "sample2_rmsd.txt" \) -exec cat {} \; | grep -v '^$' >> "$output_file"
done

echo "Combined all files into $output_file"
