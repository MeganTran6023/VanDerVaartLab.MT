#!/bin/bash

# Set the current working directory as the project directory
projectDir=$(pwd)

base_dir=$1

subd="in aj"

parameters="shift slide rise tilt"

# Verify User input
if [ -z "$base_dir" ]; then
    echo "Error: dir_names variable is empty"
    echo "Supply one of these as the argument to this script: XTUY, XCUY, or XUCY"
    exit 1
fi

# List all subdirectories in the base directory - run in UT_Flip directory
subdirectories=($(find "$base_dir" -maxdepth 1 -type d -not -name "$base_dir"))

#remove preexisting file txt
rm -f Average_structural*.txt


# Loop through each subdirectory, incorporates subd names into full dna sequence
for sub_dir in "${subdirectories[@]}"; do
        for dir in $subd
                 do
                dir_name=$(basename "$sub_dir")
                File_name2="$projectDir/Twist_avg_major.txt"
                File_name3="$projectDir/Twist_avg_minor.txt"
                #enter into each subdirectory
                sub_dir_path="$projectDir/$sub_dir/prod/m${dir}or/an/steps"

            # Change to the subdirectory
            cd "$sub_dir_path" || exit


                #find .dat file,  empty rows

                ##shift - 2/dev/null suppresses error messages
                shift_maj=$(awk '$3 != "" {sum+=$3} END {print "'${dir_name}' major:", sum/NR}' "VAC-CGCG${dir_name}CGCG-MAJOR-shift-slide-rise-tilt-roll-twist.dat" 2>/dev/null)

                shift_min=$(awk '$3 != "" {sum+=$3} END {print "'${dir_name}' minor:", sum/NR}' "VAC-CGCG${dir_name}CGCG-MINOR-shift-slide-rise-tilt-roll-twist.dat" 2>/dev/null)

                ##slide
                slide_maj=$(awk '$4 != "" {sum+=$4} END {print "'${dir_name}' major:", sum/NR}' "VAC-CGCG${dir_name}CGCG-MAJOR-shift-slide-rise-tilt-roll-twist.dat" 2>/dev/null)

                slide_min=$(awk '$4 != "" {sum+=$4} END {print "'${dir_name}' minor:", sum/NR}' "VAC-CGCG${dir_name}CGCG-MINOR-shift-slide-rise-tilt-roll-twist.dat" 2>/dev/null)

                #rise
                rise_maj=$(awk '$5 != "" {sum+=$5} END {print "'${dir_name}' major:", sum/NR}' "VAC-CGCG${dir_name}CGCG-MAJOR-shift-slide-rise-tilt-roll-twist.dat" 2>/dev/null)

                rise_min=$(awk '$5 != "" {sum+=$5} END {print "'${dir_name}' minor:", sum/NR}' "VAC-CGCG${dir_name}CGCG-MINOR-shift-slide-rise-tilt-roll-twist.dat" 2>/dev/null)

                #tilt
                tilt_maj=$(awk '$6 != "" {sum+=$6} END {print "'${dir_name}' major:", sum/NR}' "VAC-CGCG${dir_name}CGCG-MAJOR-shift-slide-rise-tilt-roll-twist.dat" 2>/dev/null)

                tilt_min=$(awk '$6 != "" {sum+=$6} END {print "'${dir_name}' minor:", sum/NR}' "VAC-CGCG${dir_name}CGCG-MINOR-shift-slide-rise-tilt-roll-twist.dat" 2>/dev/null)

                #roll
                roll_maj=$(awk '$7 != "" {sum+=$7} END {print "'${dir_name}' major:", sum/NR}' "VAC-CGCG${dir_name}CGCG-MAJOR-shift-slide-rise-tilt-roll-twist.dat" 2>/dev/null)

                roll_min=$(awk '$7 != "" {sum+=$7} END {print "'${dir_name}' minor:", sum/NR}' "VAC-CGCG${dir_name}CGCG-MINOR-shift-slide-rise-tilt-roll-twist.dat" 2>/dev/null)

                #twist
                twist_maj=$(awk '$8 != "" {sum+=$8} END {print "'${dir_name}' major:", sum/NR}' "VAC-CGCG${dir_name}CGCG-MAJOR-shift-slide-rise-tilt-roll-twist.dat" 2>/dev/null)

                twist_min=$(awk '$8 != "" {sum+=$8} END {print "'${dir_name}' minor:", sum/NR}' "VAC-CGCG${dir_name}CGCG-MINOR-shift-slide-rise-tilt-roll-twist.dat" 2>/dev/null)


                ##twist file
                echo "$twist_maj" >> $File_name2
                echo "$twist_min" >> $File_name3


                # Return to the original directory
                cd "$projectDir"
        done
# Print result into txt file
#cat <<-EOF > Average_structural_data_GC_XTUY_major.txt


#EOF

## fix how to get each average seperately into same document

done
