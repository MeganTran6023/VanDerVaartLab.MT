#!/bin/bash

# Set the current working directory as the project directory
projectDir=$(pwd)

base_dir=$1


# Verify User input
if [ -z "$base_dir" ]; then
    echo "Error: dir_names variable is empty"
    echo "Supply one of these as the argument to this script: XTUY, XCUY, or XUCY"
    exit 1
fi

# List all subdirectories in the base directory - run in UT_Flip directory
subdirectories=($(find "$base_dir" -maxdepth 1 -type d -not -name "$base_dir"))

# Loop through each subdirectory, incorporates subd names into full dna sequence
for sub_dir in "${subdirectories[@]}"; do
        dir_name=$(basename "$sub_dir")
        File_name2="$projectDir/Average_structural_data_GC_XTUY_major.txt"
        #enter into each subdirectory
        sub_dir_path="$projectDir/$sub_dir/prod/major/an/steps"

    # Change to the subdirectory
    cd "$sub_dir_path" || exit


        #find .dat file,  empty rows

        ##shift
        x=$(awk '$3 != "" {sum+=$3} END {print "Average value of shift for '${dir_name}':", sum/NR}' "VAC-CGCG${dir_name}CGCG-MAJOR-shift-slide-rise-tilt-roll-twist.dat" > "$File_name2")

        y=$(awk '$4 != "" {sum+=$4} END {print "Average value of slide for '${dir_name}':", sum/NR}' "VAC-CGCG${dir_name}CGCG-MAJOR-shift-slide-rise-tilt-roll-twist.dat" > "$File_name2")

        echo "$x" >> "$File_name2"
        echo "$y" >> "$File_name2"

        # Return to the original directory
        cd "$projectDir"

# Print result into txt file
#cat <<-EOF > Average_structural_data_GC_XTUY_major.txt


#EOF

## fix how to get each average seperately into same document

done
~
