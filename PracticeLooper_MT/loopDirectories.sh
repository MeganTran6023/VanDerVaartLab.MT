#!/bin/bash

directories="FileA FileB FileC"

for i in $directories; do

#go into each directory
	cd "$i" || { echo "Could not change directory to $i"; exit 1; }

# Make practice .out file in each directory

	cat <<EOF > practice.out

This is a practice .out file.
EOF

	# Optional: Print the current working directory
	pwd

	#Go to original directory
	cd ..
done


