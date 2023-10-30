#!/bin/bash
original_dir="$(pwd)"
directories=("FileA" "FileB" "FileC")

# for i in "${directories[@]}"; do
#     # Go into each directory
#     cd "$i" || { echo "Could not change directory to $i"; exit 1; }

#     # Make a practice .out file in each directory
#     cat <<EOF > practice.out
# This is a practice .out file.
# EOF

#     # Optional: Print the current working directory
#     echo "Current directory: $(pwd)"
# 	cd ..
# done

for i in "${directories[@]}"; do
    # Go into each directory
    cd "$i" || { echo "Could not change directory to $i"; exit 1; }

    # Check to see if "complete" is present (if-else statement) within the current directory
    if grep -qw 'complete' *; then
        echo "$i is complete"
        #makes new file for completes
        touch output.txt
        # Change back to the original directory
        cd "$original_dir" || { echo "Failed to change back to the original directory"; exit 1; }

    else
        echo "$i is incomplete"
        # Run a shell script for incompletes (specify the correct script name and path)

    fi

    # Go back to the original directory
    cd "$original_dir"
done

#Further improvements - learn how to run a shell script from a different directory and apply it to looped directories. I could move shell 
#script into the directory for it to work.