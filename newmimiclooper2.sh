#!/bin/bash

# Setting variables
mainDir=$(pwd)
letters="A B C D"
directories="XABD XBCD XCDD"

# Loop through the letters and change the middle two
for x in $letters; do
    for y in $letters; do
        for z in $directories; do
            # This replaces A with a (mimicking changing "A" to "a")
            base=${z//"A"/"a"}
            
            # From base, get two characters starting at index 1
            base=${base:1:2}
            
            # Plug in variables into sample sequence
            sq="GCGC${x}${base}${y}GCGC"

            # Go into the directories defined by $z
            # Make sure that these directories exist and are in the expected location
            cd "$z" || { echo "Could not change directory to $z"; exit 1; }

            # Make in and out folders
            mkdir -p "${x}${base}${y}/folder1/data/in"
            mkdir -p "${x}${base}${y}/folder2/in"

            #for out
            
            # Optional: Print the current working directory
            pwd

            # Go back to the original directory for the next iteration
            cd "$mainDir" || { echo "Could not change directory back to $mainDir"; exit 1; }
        done
    done
done
