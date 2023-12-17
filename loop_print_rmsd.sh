#!/bin/bash

# Set the current working directory as the project directory
projectDir=$(pwd)


base_dir=$1

#Verify User input
if [ -z "$base_dir" ]
then
    echo "Error: dir_names variable is empty"
    echo "Supply one of this as the argument to this script: XUAY, XUBY or XUCY"
    exit 1
fi
count=0

# Specify the file name
file_name="sample_rmsd.txt"

# List all subdirectories in the base directory
subdirectories=($(find "$base_dir" -maxdepth 1 -type d -not -name "$base_dir"))

# Loop through each subdirectory
for sub_dir in "${subdirectories[@]}"; do
    # Construct the absolute path to the subdirectory
    sub_dir_path="$projectDir/$sub_dir"

    # Enter into the subdirectory
    cd "$sub_dir_path" || { echo "Could not change directory to $sub_dir_path"; exit 1; }

    # Check if the file exists
    if [ ! -f "$file_name" ]; then
        echo "Error: File $file_name not found in $sub_dir_path"
        exit 1
    fi

    # Test - Use awk to print the first value in the first row's second column
#    value=$(awk 'NR==3 {print $2}' "$file_name")

    # Debugging output
#    echo "Debug: Current directory: $sub_dir_path"
#    echo "Debug: Value found: $value"

    # Check if a value was found
 #   if [ -z "$value" ]; then
 #       echo "No value found in $sub_dir_path/$file_name"
 #   else
 #       echo "Value found in $sub_dir_path/$file_name: $value"
 #   fi

    awk 'NR==1 {print $2}' sample_rmsd.txt
                # Calculate total sum and total number of rows
                sum=$(awk '{sum += $2} END {print sum}' "$file_name")
                total_row=$(awk 'END {print NR}' "$file_name")

                # Calculate average
                average=$(awk -v sum="$sum" -v total_row="$total_row" 'BEGIN {print sum / total_row}')

                # Print result into txt file


                echo "Average RMSD for ${sub_dir} is: $average"

    # Return to the original directory
    cd "$projectDir"
done
