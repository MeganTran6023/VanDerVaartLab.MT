#!/bin/bash

## Loop making directory in subdirectories and copy over a file from on edirectory to another

# # Set the current working directory as project directory and initialize bases and directory names.
# projectDir=$(pwd)
# letters="A B C D"
# dir_names=$1
# source_directory="/path/to/source_directory"
# file_to_move="sample_rmsd.txt"


# #Verify User input
# if [ -z "$dir_names" ]
# then
#     echo "Error: dir_names variable is empty"
#     echo "Supply one of this as the argument to this script: XUAY, XUBY or XUCY"
#     exit 1
# fi
# count=0

# #Make all directory combos
# cd $dir_names

# for x in $letters; do
#         for y in $letters; do
#                 for z in $dir_names; do
#                         #changes base letter from U to D
#                         bb=${z/U/D}
#                         #get middle two values from directory name
#                         bb=${bb:1:2}
#                         #define format of directory name
#                         sub_dir=${x}${bb}${y}

#                         #enter into each subdirectory
#                         #|| is to easily affect each directory instead of messing up whole directory path
#                         (
#                                 cd "$projectDir/$dir_names/$sub_dir" || exit
#                                 #make new directory
#                                 mkdir path2
#                                 #go into new directory
#                                 cd path2
#                                 #move rmsd data
#                                 cp "$projectDir/$dir_names/$file_to_move" .

#                                 #check if moving file worked
#                                 if [ $? -eq 0 ]; then
#                                         echo "File moved successfully."
#                                 else
#                                         echo "Error: Failed to move the file."
#                                 fi
#                         )


#                 done
#         done
# done

# ~
# ~



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
    path2="$sub_dir_path/path2"


    # Enter into the subdirectory
    cd "$sub_dir_path" || { echo "Could not change directory to $sub_dir_path"; exit 1; }
    cd "$path2" || { echo "Could not change directory to $sub_dir_path"; exit 1; }

cat <<EOF > print_rmsd_TRIAL1.sh
#!/bin/bash

# 1 - get rmsd data alone from .txt files - block 1
awk 'NR>5' sample_rmsd.txt > sample_rmsd.txt_output.txt
chmod +r block1rmsd_minor_output.txt

EOF


        #Make script executable
        chmod +x print_rmsd_TRIAL1.sh
        #run script
        ./print_rmsd_TRIAL1.sh

    # Check if the file exists
    if [ ! -f "$file_name" ]; then
        echo "Error: File $file_name not found in $sub_dir_path"
        exit 1
    fi


