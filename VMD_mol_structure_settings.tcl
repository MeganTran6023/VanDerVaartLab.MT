# VMD_mol_structure_settings.tcl

# Variables
echo "Enter .pdb file directory path"
read input_pdb
# Load pdb file
mol $input_pdb

# My settings for resname URA
mol representation Licorice 0.100000 10.000000 4.100000 0
mol selection resname URA
mol material Opsin
mol color ID 5
mol addrep top

# Apply trajectory smoothing with a window size of 10 frames
mol smoothrep top 0 10 
