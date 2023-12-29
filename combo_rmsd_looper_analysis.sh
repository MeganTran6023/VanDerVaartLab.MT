#!/bin/bash

# Set the current working directory as the project directory
projectDir=$(pwd)

base_dir=$1

# Verify User input
if [ -z "$base_dir" ]; then
    echo "Error: dir_names variable is empty"
    echo "Supply one of these as the argument to this script: XTUY, XCUY, or XUCY"
    exit 1
fi

# List all subdirectories in the base directory
subdirectories=($(find "$base_dir" -maxdepth 1 -type d -not -name "$base_dir"))

# Loop through each subdirectory, incorporates subd names into full dna sequence
for sub_dir in "${subdirectories[@]}"; do
        dir_name=$(basename "$sub_dir")
#lowercase
        lower_dir=${dir_name,,}
        full_seq="cgcg${lower_dir}cgcg"
        #enter into each subdirectory
        sub_dir_path="$projectDir/$sub_dir"

    # Change to the subdirectory
    cd "$sub_dir_path" || exit

    # Create or append to the .txt file in each subd
    cat <<EOF > rmsd.cpptraj_minor_fileconversion

# Prints out sequences with variable "cgcg{seq}cgcg"
# RMSD cpptraj file conversion
parm dna-$full_seq.prmtop
trajin mini2-$full_seq.ncrst
strip (:WAT)
trajout vac-$full_seq.nc
go
EOF

cat <<EOF > rmsd.cpptraj_fileconversion

# Prints out sequences with variable "cgcg{seq}cgcg"
# RMSD cpptraj file conversion
parm dna-$full_seq.prmtop
trajin mini2-$full_seq.ncrst
strip (:WAT)
trajout vac-$full_seq.nc
go
EOF

#Execute permissions for cpptraj
chmod +x rmsd.cpptraj_fileconversion
chmod +x rmsd.cpptraj_minor_fileconversion

#Load module
#        module load apps/amber/18-19
# Run the cpptraj scripts

#        cpptraj -i rmsd.cpptraj_fileconversion
#        cpptraj -i rmsd.cpptraj_minor_fileconversion

#make new directory to store vac files
        mkdir ref_vac

# move vac files into directory
#        mv *vac* ref_vac

    # Print debugging information
    echo "rmsd.cpptraj_fileconversion and rmsd.cpptraj_minor_fileconversion made and ran in $sub_dir_path!"

    # Return to the original directory
    cd "$projectDir" || exit
done


# Loop through each subdirectory, incorporates subd names into full dna sequence
for sub_dir in "${subdirectories[@]}"; do
        dir_name=$(basename "$sub_dir")
#lowercase
        lower_dir=${dir_name,,}
        full_seq="cgcg${lower_dir}cgcg"
        #enter into each subdirectory
        sub_dir_path="$projectDir/$sub_dir"

    # Change to the subdirectory
    cd "$sub_dir_path" || exit

    # Major -  Construct the absolute path to the subdirectory
    sub_dir_major_path="$projectDir/$sub_dir/prod/major"

    # Change to the subdirectory (|| prevents overwriting)
    cd "$sub_dir_major_path" || exit

    # Find the highest .dcd file
    highest_dcd_major=$(ls -1 vac*.dcd 2>/dev/null | sort -V | tail -n 1)

    # Minor - Construct the absolute path to the subdirectory
    sub_dir_minor_path="$projectDir/$sub_dir/prod/minor"

    # Change to the subdirectory (|| prevents overwriting)
    cd "$sub_dir_minor_path" || exit

    # Find the highest .dcd file
    highest_dcd_minor=$(ls -1 vac*.dcd 2>/dev/null | sort -V | tail -n 1)


#Make cpptraj script for rmsd analysis
    cat <<-EOF > rmsd_analy_major_${dir_name}

#this is for major

parm ${dir_name}/prod/major/vac_$full_seq-major.prmtop
reference ${dir_name}/ref_vac/vac-$full_seq-major.nc

#i will edit the vac number at some point
trajin ${dir_name}/prod/major/$highest_dcd_major

rmsd :2-5,20-23&!@H reference out block1_major_rmsd.txt mass
rmsd :9-11,14-16&!@H reference out block2_major_rmsd.txt mass
go
EOF

#Make cpptraj script for rmsd analysis - minor
    cat <<-EOF > rmsd_analy_minor_${dir_name}

#this is for minor

parm ${dir_name}/prod/minor/vac_$full_seq-minor.prmtop
reference ${dir_name}/ref_vac/vac-$full_seq-minor.nc

#i will edit the vac number at some point
trajin ${dir_name}/prod/minor/$highest_dcd_minor
rmsd :2-5,20-23&!@H reference out block1_minor_rmsd.txt mass
rmsd :9-11,14-16&!@H reference out block2_minor_rmsd.txt mass
go
EOF

echo "cpptraj script for rmsd analysis for major and minor made in $sub_dir_path ."

#Execute permissions for cpptraj
chmod +x rmsd_analy_major_${dir_name}
chmod +x rmsd_analy_minor_${dir_name}

#input necessary module - has cpptraj
module purge
module load apps/amber/18-19

#runs cpptraj script
#echo "Running cpptraj major and minor scripts for ${dir_name}"
#cpptraj -i rmsd_analy_major_${dir_name}
#cpptraj -i rmsd_analy_minor_${dir_name}

#move cpptraj script
echo "Moving cpptraj major and minor scripts into $sub_dir_path"
mv rmsd_analy_major_${dir_name} $dir_name
mv rmsd_analy_minor_${dir_name} $dir_name

#move .txt mass files into respective directories
#echo "Moving cpptraj major and minor output block 1 and 2 into $sub_dir_path"
#mv block1_major_rmsd.txt block2_major_rmsd.txt $dir_name
#mv block1_minor_rmsd.txt block2_minor_rmsd.txt $dir_name
done


