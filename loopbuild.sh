#!/bin/bash
#this uses the meganBuild.inp for each .pdb file made in XCUY, XUCY, and XTUY


# Define directories where .pdb files are located
directory1="/Users/megantran/projects/ExampleProjectMT/uracil_mutation/XCUY"
directory2="/Users/megantran/projects/ExampleProjectMT/uracil_mutation/XTUY"
directory3="/Users/megantran/projects/ExampleProjectMT/uracil_mutation/XUCY"

# Define the template for the .inp file
template="meganBuild.inp"

# Check if the template file exists
if [ ! -f "$template" ]; then
    echo "Template file '$template' not found."
    exit 1
fi

# Function to process .pdb files
process_pdb_files() {
    local pdb_directory="$1"
    local output_directory="$2"

    # Loop through .pdb files in the specified directory
    for pdb_file in "$pdb_directory"/*.pdb; do
        # Generate a unique .inp file for each .pdb file
        inp_file="${output_directory}/$(basename ${pdb_file%.pdb}).inp"
        cp "$template" "$inp_file"
        sed -i "s|###PDB_FILE###|$pdb_file|" "$inp_file"

        # Execute CHARMM with the generated .inp file
        charmm < "$inp_file"

        # Optionally, perform additional processing here if needed
    done
}

# Process .pdb files in each directory
process_pdb_files "$directory1" "output_directory1"
process_pdb_files "$directory2" "output_directory2"
process_pdb_files "$directory3" "output_directory3"
