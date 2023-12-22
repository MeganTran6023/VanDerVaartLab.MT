#!/bin/bash

dir_names=$1
file_name="${dir_names}/all_block1_rmsd.txt"
file_name2="${dir_names}/all_block2_rmsd.txt"

#Verify User input
if [ -z "$dir_names" ]
then
    echo "Error: dir_names variable is empty"
    echo "Supply one of this as the argument to this script: XTUY, XCUY or XUCY"
    exit 1
fi
count=0

##block 1 - get .txt files

# Create the output file if it doesn't exist
#[ -e "$file_name" ] || touch "$file_name"

# Loop through subdirectories in XUAY
#for dir in "$base_directory"/; do

    # Find both files in each subdirectory, remove empty lines, and concatenate them into one file
 #   find "$dir" -type f \( -name "block1rmsd_output_COPY.txt" -o -name "block1rmsd_minor_output_COPY.txt" \) -exec cat {} \; | grep -v '^$' >> "$file_name"
#done

#echo "Combined all files into $output_file"

##block 2 - get .txt files

# Create the output file if it doesn't exist
#[ -e "$file_name2" ] || touch "$file_name2"

# Loop through subdirectories in XUAY
#for dir in "$dir_names"/; do

    # Find both files in each subdirectory, remove empty lines, and concatenate them into one file
 #   find "$dir" -type f \( -name "block2rmsd_output_COPY.txt" -o -name "block2rmsd_minor_output_COPY.txt" \) -exec cat {} \; | grep -v '^$' >> "$file_name2"
#done

#echo "Combined all files into $file_name2"


# Get average value from block1 combined txt file
        # Calculate total sum and total number of rows - block 1
                sum1=$(awk '{sum += $2} END {print sum}' "$file_name")
                total_row1=$(awk 'END {print NR}' "$file_name")

                # Calculate average - block 1
                average1=$(awk -v sum="$sum1" -v total_row="$total_row1" 'BEGIN {print sum / total_row}')

# Get average value from block2 combined txt file
        # Calculate total sum and total number of rows - block 1
                sum2=$(awk '{sum += $2} END {print sum}' "$file_name2")
                total_row2=$(awk 'END {print NR}' "$file_name2")

                # Calculate average - block 2
                average2=$(awk -v sum_2="$sum2" -v total_row_2="$total_row2" 'BEGIN {print sum_2 / total_row_2}')

#median - block1

median1=$(awk '
{
     a[x++]=$2
}
END{
    print a[int((x-1)/2)]
}' XTUY/all_block1_rmsd.txt)

echo "Median calculated for block 1"

#median - block2

median2=$(awk '
{
     a[x++]=$2
}
END{
    if (x % 2 == 1) {
        print a[int((x-1)/2)]
    } else {
        print (a[int(x/2)] + a[int(x/2)-1]) / 2
    }
}' XTUY/all_block2_rmsd.txt)
echo "Median calculated for block 2"


# Print result into txt file
cat <<-EOF > rmsdAvg_block1and2_total.txt

Average RMSD for all block 1 sequences: $average1

Average RMSD for all block 2 sequences: $average2

Median RMSD for all block 1 sequences: $median1

Median RMSD for all block 2 sequences: $median2

        EOF
