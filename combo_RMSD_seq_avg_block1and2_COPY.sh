#!/bin/bash

#RMSD_avg_looper_calculation_block1.sh and RMSD_avg_looper_calculation_block2.sh
#and minors

# Set the current working directory as the project directory
projectDir=$(pwd)

letters="A C G T"


base_dir=$1

#Verify User input
if [ -z "$base_dir" ]
then
    echo "Error: base_dir variable is empty"
    echo "Supply one of this as the argument to this script: XUCY, XTUY or XCUY"
    exit 1
fi
count=0

#Make all directory combos
cd $base_dir

for x in $letters; do
        for y in $letters; do
                for z in $base_dir; do
                        #changes base letter from U to T
                        bb=${z/U/T}
                        #get middle two values from directory name
                        bb=${bb:1:2}
                        #define format of directory name
                        sub_dir=${x}${bb}${y}

                        #enter into each subdirectory
                        #|| is to easily affect each directory instead of messing up whole directory path
                        
                                cd "$projectDir/$base_dir/$sub_dir" || exit
                                #make a rmsd cpptraj file in each directory
                                cat <<EOF > print_rmsd_majorandminor_avg.sh
#!/bin/bash

### edit isolating certain lines as needed!!!! ###

#major
#1 - get rmsd data alone from .txt files - block 1
awk 'NR>297' block1_major_rmsd.txt > block1_major_rmsd_output.txt
chmod +r block1_major_rmsd_output.txt

#2 - get rmsd data alone from .txt files - block 2
awk 'NR>297' block2_major_rmsd.txt > block2_major_rmsd_output.txt
chmod +r block2_major_rmsd_output.txt

#minor
#3 - get rmsd data alone from .txt files - block 1
awk 'NR>297' block1_minor_rmsd.txt > block1_minor_rmsd_output.txt
chmod +r block1_major_rmsd_output.txt

#4 - get rmsd data alone from .txt files - block 2
awk 'NR>297' block2_minor_rmsd.txt > block2_minor_rmsd_output.txt
chmod +r block2_major_rmsd_output.txt

EOF

                                #Make script executable
                                chmod +x print_rmsd_majorandminor_avg.sh
                                #run script
                                ./print_rmsd_majorandminor_avg.sh
                                #make copy of file
                                cp block1_major_rmsd_output.txt block1_major_rmsd_output_COPY.txt
                                cp block2_major_rmsd_output.txt block2_major_rmsd_output_COPY.txt
                                cp block1_minor_rmsd_output.txt block1_minor_rmsd_output_COPY.txt
                                cp block2_minor_rmsd_output.txt block2_minor_rmsd_output_COPY.txt
                                
                                echo "Copied output.txt files!"

                        
                done
        done
done

# ------------- uncomment sections below after finding relaxation times!!!! -------------

# ------------- This finds average RMSD for EACH SINGLE SEQUENCE -------------

# # Specify the file name
# output_file="$projectDir/rmsd_avg_block1_major.txt"
# output_file2="$projectDir/rmsd_avg_block2_major.txt"
# output_file3="$projectDir/rmsd_avg_block1_minor.txt"
# output_file4="$projectDir/rmsd_avg_block2_minor.txt"

# # Specify the file name
# file_name="block1_major_rmsd_output_COPY.txt"
# file_name2="block2_major_rmsd_output_COPY.txt"
# file_name3="block1_minor_rmsd_output_COPY.txt"
# file_name4="block2_minor_rmsd_output_COPY.txt"

# # List all subdirectories in the base directory
# subdirectories=($(find "$base_dir" -maxdepth 1 -type d -not -name "$base_dir"))

# # Loop through each subdirectory
# for sub_dir in "${subdirectories[@]}"; do
#     # Construct the absolute path to the subdirectory
#     sub_dir_path="$projectDir/$sub_dir"

#     # Enter into the subdirectory
#     cd "$sub_dir_path" || { echo "Could not change directory to $sub_dir_path"; exit 1; }

#     # Check if the file exists
#     if [ ! -f "$file_name" ]; then
#         echo "Error: File $file_name not found in $sub_dir_path"
#         exit 1
#     fi

#     awk 'NR==1 {print $2}' block1rmsd_output_COPY.txt
#                 # Calculate total sum and total number of rows
#                 ##may edit NR - 1 part
#                 sum=$(awk '{sum += $2} END {print sum}' "$file_name")
#                 total_row=$(awk 'END {print NR -1}' "$file_name")

#                 # Calculate average
#                 average=$(awk -v sum="$sum" -v total_row="$total_row" 'BEGIN {print sum / total_row}')
#                 # Print result into the output file

#                 echo "${sub_dir}: $average" >> "$output_file"

#                 # Return to the original directory
#                 cd "$projectDir"
# done

# # Loop through each subdirectory
# for sub_dir in "${subdirectories[@]}"; do
#     # Construct the absolute path to the subdirectory
#     sub_dir_path="$projectDir/$sub_dir"

#     # Enter into the subdirectory
#     cd "$sub_dir_path" || { echo "Could not change directory to $sub_dir_path"; exit 1; }

#     # Check if the file exists
#     if [ ! -f "$file_name2" ]; then
#         echo "Error: File $file_name2 not found in $sub_dir_path"
#         exit 1
#     fi

#     awk 'NR==1 {print $2}' block2rmsd_output_COPY.txt
#                 # Calculate total sum and total number of rows
#                 sum2=$(awk '{sum += $2} END {print sum}' "$file_name2")
#                 total_row2=$(awk 'END {print NR - 1}' "$file_name2")

#                 # Calculate average
#                 average2=$(awk -v sum="$sum2" -v total_row="$total_row2" 'BEGIN {print sum / total_row}')

#     # Print result into the output file
#     echo "${sub_dir}: $average2" >> "$output_file2"

#     # Return to the original directory
#     cd "$projectDir"
# done

# for sub_dir in "${subdirectories[@]}"; do
#     # Construct the absolute path to the subdirectory
#     sub_dir_path="$projectDir/$sub_dir"
#     path2="$sub_dir_path/minor_rmsd"

#     # Enter into the subdirectory
#     cd "$path2" || { echo "Could not change directory to $path2"; exit 1; }

#     # Check if the file exists
#     if [ ! -f "$file_name3" ]; then
#         echo "Error: File $file_name3 not found in $path2"
#         exit 1
#     fi

#     awk 'NR==1 {print $2}' "$file_name3"
#                 # Calculate total sum and total number of rows
#                 sum3=$(awk '{sum += $2} END {print sum}' "$file_name3")
#                 total_row3=$(awk 'END {print NR -1}' "$file_name3")

#                 # Calculate average
#                 average3=$(awk -v sum="$sum3" -v total_row="$total_row3" 'BEGIN {print sum / total_row}')
#                 # Print result into the output file

#                 echo "${sub_dir}_minor: $average3" >> "$output_file3"

#                 # Return to the original directory
#                 cd "$projectDir"
# done

# # Loop through each subdirectory
# for sub_dir in "${subdirectories[@]}"; do
#     # Construct the absolute path to the subdirectory
#     sub_dir_path="$projectDir/$sub_dir"
#     path2="$sub_dir_path/minor_rmsd"

#     # Enter into the subdirectory
#     cd "$path2" || { echo "Could not change directory to $path2"; exit 1; }

#     # Check if the file exists
#     if [ ! -f "$file_name4" ]; then
#         echo "Error: File $file_name4 not found in $path2"
#         exit 1
#     fi

#     awk 'NR==1 {print $2}' "$file_name4"
#                 # Calculate total sum and total number of rows
#                 sum4=$(awk '{sum += $2} END {print sum}' "$file_name4")
#                 total_row4=$(awk 'END {print NR -1}' "$file_name4")

#                 # Calculate average
#                 average4=$(awk -v sum="$sum4" -v total_row="$total_row4" 'BEGIN {print sum / total_row}')
#                 # Print result into the output file

#                 echo "${sub_dir}_minor: $average4" >> " $output_file4"

#                 # Return to the original directory
#                 cd "$projectDir"
# done

# # ------------- This finds average and median RMSD for COMBINED SEQUENCES -------------

# File_name="${base_dir}/all_block1_rmsd.txt"
# File_name2="${base_dir}/all_block2_rmsd.txt"

# # Create the output file if it doesn't exist
# [ -e "$File_name" ] || touch "$File_name"

# # Loop through subdirectories in XUAY
# for dir in "$base_dir"/; do

#     # Find both files in each subdirectory, remove empty lines, and concatenate them into one file
#     find "$dir" -type f \( -name "block1rmsd_output_COPY.txt" -o -name "block1rmsd_minor_output_COPY.txt" \) -exec cat {} \; | grep -v '^$' >> "$File_name"
# done

# echo "Combined all files into $File_name"

# ##block 2 - get .txt files

# # Create the output file if it doesn't exist
# [ -e "$File_name2" ] || touch "$File_name2"

# # Loop through subdirectories in XUAY
# for dir in "$base_dir"/; do

#     # Find both files in each subdirectory, remove empty lines, and concatenate them into one file
#     find "$dir" -type f \( -name "block2rmsd_output_COPY.txt" -o -name "block2rmsd_minor_output_COPY.txt" \) -exec cat {} \; | grep -v '^$' >> "$File_name2"
# done

# echo "Combined all files into $File_name2"


# # Get average value from block1 combined txt file
#         # Calculate total sum and total number of rows - block 1
#                 Sum1=$(awk '{sum += $2} END {print sum}' "$File_name")
#                 Total_row1=$(awk 'END {print NR}' "$File_name")

#                 # Calculate average - block 1
#                 average1=$(awk -v sum="$Sum1" -v total_row="$Total_row1" 'BEGIN {print sum / total_row}')

# # Get average value from block2 combined txt file
#         # Calculate total sum and total number of rows - block 1
#                 Sum2=$(awk '{sum += $2} END {print sum}' "$File_name2")
#                 Total_row2=$(awk 'END {print NR}' "$File_name2")

#                 # Calculate average - block 2
#                 average2=$(awk -v sum_2="$Sum2" -v total_row_2="$Total_row2" 'BEGIN {print sum_2 / total_row_2}')

# #median - block1

# median1=$(awk '
# {
#      a[x++]=$2
# }
# END{
#     print a[int((x-1)/2)]
# }' XTUY/all_block1_rmsd.txt)

# echo "Median calculated for block 1"

# #median - block2

# median2=$(awk '
# {
#      a[x++]=$2
# }
# END{
#     if (x % 2 == 1) {
#         print a[int((x-1)/2)]
#     } else {
#         print (a[int(x/2)] + a[int(x/2)-1]) / 2
#     }
# }' XTUY/all_block2_rmsd.txt)
# echo "Median calculated for block 2"


# # Print result into txt file
# cat <<-EOF > rmsdAvg_block1and2_total.txt

# Average RMSD for all block 1 sequences: $average1

# Average RMSD for all block 2 sequences: $average2

# Median RMSD for all block 1 sequences: $median1

# Median RMSD for all block 2 sequences: $median2

#         EOF
