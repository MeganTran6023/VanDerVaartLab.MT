#!/bin/bash

# Set the current working directory as project directory and initialize bases and directory names.
projectDir=$(pwd)
letters="A B C D"
dir_names=$1

#Verify User input
if [ -z "$dir_names" ]
then
    echo "Error: dir_names variable is empty"
    echo "Supply one of this as the argument to this script: XUAY, XUBY or XUCY"
    exit 1
fi
count=0

#Make all directory combos
cd $dir_names

for x in $letters; do
        for y in $letters; do
                for z in $dir_names; do
                        #changes base letter from U to D
                        bb=${z/U/D}
                        #get middle two values from directory name
                        bb=${bb:1:2}
                        #define format of directory name
                        sub_dir=${x}${bb}${y}

                        #make all possible sequence combinations
                        mkdir -p "$projectDir/$dir_names/$sub_dir"

                done
        done
done
