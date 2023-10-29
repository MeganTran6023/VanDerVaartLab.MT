#!/bin/bash

directories=("FileA" "FileB" "FileC")

for i in "${directories[@]}"; do
    # Go into each directory
    cd "$i" || { echo "Could not change directory to $i"; exit 1; }

    # Make a practice .out file in each directory
    cat <<EOF > practice.out
This is a practice .out file.
EOF

    # Optional: Print the current working directory
    echo "Current directory: $(pwd)"

    # Check to see if "complete" is present (if-else statement)
    if grep -q 'complete' *; then
        echo "$i is complete"
    else
        echo "$i is incomplete"
    fi

    # Go back to the original directory
    cd ..
done
