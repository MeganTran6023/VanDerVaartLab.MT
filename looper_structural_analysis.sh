#!/bin/bash

# Set the current working directory as the project directory
projectDir=$(pwd)

base_dir=$1

subd="in aj"

base_path="/work/m/megantran"


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

                #Twist
                File_name2="$projectDir/Twist_avg_major.txt"
                File_name3="$projectDir/Twist_avg_minor.txt"

                #shift
                shift_major_file="$projectDir/Shift_avg_major.txt"
                shift_minor_file="$projectDir/Shift_avg_minor.txt"
                #slide
                slide_major_file="$projectDir/Slide_avg_major.txt"
                slide_minor_file="$projectDir/Slide_avg_minor.txt"

                #rise
                rise_major_file="$projectDir/Rise_avg_major.txt"
                rise_minor_file="$projectDir/Rise_avg_minor.txt"
                #tilt
                tilt_major_file="$projectDir/Tilt_avg_major.txt"

                tile_minor_file="$projectDir/Tilt_avg_minor.txt"
                #roll
                roll_major_file="$projectDir/Roll_avg_major.txt"
                roll_minor_file="$projectDir/Roll_avg_minor.txt"
                #enter into each subdirectory
                sub_dir_path="$projectDir/$sub_dir/prod/m${dir}or/an/steps"

            # Change to the subdirectory
            cd "$sub_dir_path" || exit


                #find .dat file,  empty rows, calculates average for said parameter

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


                ##print our all sequences parameters into their respective files
                echo "$twist_maj" >> $File_name2
                echo "$twist_min" >> $File_name3

                #shift
                echo "$shift_maj" >> $shift_major_file
                echo "$shift_min" >> $shift_minor_file

                #slide
                echo "$slide_maj" >> $slide_major_file
                echo "$slide_min" >> $slide_minor_file 

                #rise
                echo "$rise_maj" >> $rise_major_file
                echo "$rise_min" >> $rise_minor_file 
                #tilt
                echo "$tilt_maj" >> $tilt_major_file
                echo "$tilt_min" >> $tilt_minor_file 
                #roll
                echo "$roll_maj" >> $roll_major_file
                echo "$roll_min" >> $roll_minor_file 
                #twist
                echo "$twist_maj" >> $twist_major_file
                echo "$twist_min" >> $twist_minor_file 

                # Return to the original directory
                cd "$projectDir"
        done

#put all .txt files into one directory
mkdir Structural_Analysis_GC_XTUY
cd Structural_Analysis_GC_XTUY

mv $base_path/Twist_avg_major.txt .
mv $base_path/Twist_avg_minor.txt .
mv $base_path/Shift_avg_major.txt .
mv $base_path/Shift_avg_minor.txt .

mv $base_path/Slide_avg_major.txt .
mv $base_path/Slide_avg_minor.txt .
mv $base_path/Rise_avg_major.txt .
mv $base_path/Rise_avg_minor.txt .

mv $base_path/Tilt_avg_major.txt .
mv $base_path/Tilt_avg_minor.txt .
mv $base_path/Roll_avg_major.txt .
mv $base_path/Roll_avg_minor.txt .
# Return to the original directory
cd "$projectDir"

    done
done

~                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ~                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ~                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ~                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ~               
