#!/bin/bash

#For minor seq block 1
# Set the current working directory as the project directory
projectDir=$(pwd)
base_dir=$1

#Verify User input
if [ -z "$base_dir" ]
then
    echo "Error: dir_names variable is empty"
    echo "Supply one of this as the argument to this script: XCUY, XTUY or XUCY"
    exit 1
fi
count=0

# Specify the file name
file_name="block1rmsd_minor.txt"
file_name2="block2rmsd_minor.txt"

# List all subdirectories in the base directory
subdirectories=($(find "$base_dir" -maxdepth 1 -type d -not -name "$base_dir"))

# Loop through each subdirectory
for sub_dir in "${subdirectories[@]}"; do
    # Construct the absolute path to the subdirectory
    sub_dir_path="$projectDir/$sub_dir"
    path2="$sub_dir_path/minor_rmsd"


    # Enter into the subdirectory
    cd "$sub_dir_path" || { echo "Could not change directory to $sub_dir_path"; exit 1; }
    cd "$path2" || { echo "Could not change directory to $sub_dir_path"; exit 1; }

cat <<EOF > print_rmsd_minor_block1.sh
#!/bin/bash

# 1 - get rmsd data alone from .txt files - block 1
awk 'NR>297' block1rmsd_minor.txt > block1rmsd_minor_output.txt
chmod +r block1rmsd_minor_output.txt

EOF

cat <<EOF > print_rmsd_minor_block2.sh
#!/bin/bash

# 1 - get rmsd data alone from .txt files - block 2
awk 'NR>297' block2rmsd_minor.txt > block2rmsd_minor_output.txt
chmod +r block2rmsd_minor_output.txt

EOF

cat <<EOF > README_minor.txt
Explanation of files:

1 -> block1rmsd_minor.txt + block2rmsd_minor.txt

** original RMSD data from running cpptraj
** use xmgrace (file name)

2 -> print_rmsd_minor_block1.sh + print_rmsd_minor_block2.sh
** shell script to extract lines 298 until end from (1) for respective blocks

3 -> block1rmsd_minor_output.txt + block2rmsd_minor_output.txt
** output txt from (2)

4 -> block1rmsd_minor_output_COPY.txt + block2rmsd_minor_output.txt
** Copy of (3)



EOF

        #Make script executable
        chmod +x print_rmsd_minor_block1.sh
        #run script
        ./print_rmsd_minor_block1.sh

        #Make script executable
        chmod +x print_rmsd_minor_block2.sh
        #run script
        ./print_rmsd_minor_block2.sh

        #copy output file
        cp block1rmsd_minor_output.txt block1rmsd_minor_output_COPY.txt

        cp block2rmsd_minor_output.txt block2rmsd_minor_output_COPY.txt


    # Check if the file exists
    if [ ! -f "$file_name" ]; then
        echo "Error: File $file_name not found in $sub_dir_path"
        exit 1
    fi

        # Check if the file exists
    if [ ! -f "$file_name2" ]; then
        echo "Error: File $file_name2 not found in $sub_dir_path"
        exit 1
    fi



        #Return to original directory
        cd -
done

~
~
