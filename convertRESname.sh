#tells interpreter what language to use
#!/bin/bash
# This code will convert certain keywords in a .pdb file to keywords that works with CHARMM or AMBER

#establish variables
pdbfile=$1
convertTo=$2
convertTo=${convertTo,,}

#conversion to charmm
if [[ "$convertTo" =~ "charmm" ]]
then
    sed -i 's:\ DA:ADE:g; s:\ DC:CYT:g; s:\ DG:GUA:g; s:\ \ U:URA:g; s:\ DT:THY:g' $pdbfile
      # we replace \ DA with ADE for all instances of this (hence the use of "g"). Same concept applies
    
    sed -i 's:C7\ \ \ DT:C5M\ THY:g' $pdbfile
    sed -i 's:OP1:O1P:g; s:OP2:O2P:g' $pdbfile

#conversion to amber
elif [[ "$convertTo" =~ "amber" ]]
then
    sed -i 's:ADE:\ DA:g; s:CYT:\ DC:g; s:GUA:\ DG:g; s:URA:\ \ U:g; s:THY:\ DT:g' $pdbfile
    sed -i 's:C5M\ THY:C7\ \ \ DT:g' $pdbfile
    sed -i 's:O1P:OP1:g; s:O2P:OP2:g' $pdbfile

#if input in terminal is incorrect format
else
    echo "Error: second argument must be given either as \"charmm\" or \"amber\""
fi
