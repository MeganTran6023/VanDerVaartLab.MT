#!/bin/bash

# Set the current working directory as the project directory
projectDir=$(pwd)

base_dir=$1

# Verify User input
if [ -z "$base_dir" ]; then
    echo "Error: dir_names variable is empty"
    echo "Supply one of these as the argument to this script: XUAY, XUBY, or XUCY"
    exit 1
fi

# List all subdirectories in the base directory
subdirectories=($(find "$base_dir" -maxdepth 1 -type d -not -name "$base_dir"))

# Loop through each subdirectory, incorporates subd names into full dna sequence
for sub_dir in "${subdirectories[@]}"; do
        dir_name=$(basename "$sub_dir")
#lowercase
        lower_dir=${dir_name,,}
        full_seq="cgcg${lower_dir}cgcg"
        #enter into each subdirectory
        sub_dir_path="$projectDir/$sub_dir"

    # Change to the subdirectory
    cd "$sub_dir_path" || exit

    # Create or append to the testing.txt file in each subd
    cat <<EOF > Complete_seq.txt

# Prints out sequences with variable "cgcg{seq}cgcg"
# RMSD cpptraj file conversion
parm dna-$full_seq.prmtop
trajin mini2-$full_seq.ncrst
strip (:WAT)
trajout vac-$full_seq.nc
go
EOF

    # Print debugging information
    echo "Complete_seq.txt made in $sub_dir_path!"

    # Return to the original directory
    cd "$projectDir" || exit
done

