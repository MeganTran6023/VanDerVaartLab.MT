#!/bin/bash

pdbfile=$1
convertTo=$2
convertTo=${convertTo,,}

bN=$3

# Correcting typos and modifying some sed and awk commands for functionality
if [ "$bN" == "7" ]
then
## MT- this part is the same thing seen in convertRESname.sh (renaming for CHARMM or AMBER use)
    if [[ "$convertTo" =~ "charmm" ]]
    then
        sed -i 's:\ DA:ADE:g; s:\ DC:CYT:g; s:\ DG:GUA:g; s:\ \ U:URA:g; s:\ DT:THY:g' "$pdbfile"
        sed -i 's:C7\ \ \ DT:C5M\ THY:g' "$pdbfile"
        sed -i 's:OP1:O1P:g; s:OP2:O2P:g' "$pdbfile"
        sed -i '/C7\ \ THY\ A\ \ \ 7/d' "$pdbfile"  # Fixed variable name typo
        echo "REMARK" > "a_$pdbfile"
        echo "REMARK" > "b_$pdbfile"
        awk -v a="a_$pdbfile" -v b="b_$pdbfile" '{  # Corrected variable assignment in awk
            if ($6 == 7)
                gsub($4,"URA")
            if ($5 == "A")
                print $0 >> a
            else
                print $0 >> b
            }' "$pdbfile"
        echo "END" >> "a_$pdbfile"
        echo "END" >> "b_$pdbfile"
    elif [[ "$convertTo" =~ "amber" ]]
    then
        sed -i 's:ADE:\ DA:g; s:CYT:\ DC:g; s:GUA:\ DG:g; s:URA:\ \ U:g; s:THY:\ DT:g' "$pdbfile"
        sed -i 's:C5M\ THY:C7\ \ \ DT:g' "$pdbfile"
        sed -i 's:O1P:OP1:g; s:O2P:OP2:g' "$pdbfile"
        sed -i '/C7\ \ \ DT\ A\ \ \ 7/d' "$pdbfile"  # Fixed a sed command syntax error
        echo "REMARK" > "a_$pdbfile"
        echo "REMARK" > "b_$pdbfile"
        awk -v a="a_$pdbfile" -v b="b_$pdbfile" '{  # Corrected variable assignment in awk
            if ($6 == 7)
                gsub($4," U")
            if ($5 == "A")
                print $0 >> a
            else
                print $0 >> b
            }' "$pdbfile"
        echo "END" >> "a_$pdbfile"
        echo "END" >> "b_$pdbfile"
    else
        echo "Error: second argument must be given either as \"charmm\" or \"amber\""
    fi
elif [ "$bN" == "6" ]
then

    if [[ "$convertTo" =~ "charmm" ]]
    then
        sed -i 's:\ DA:ADE:g; s:\ DC:CYT:g; s:\ DG:GUA:g; s:\ \ U:URA:g; s:\ DT:THY:g' "$pdbfile"
        sed -i 's:C7\ \ \ DT:C5M\ THY:g' "$pdbfile"
        sed -i 's:OP1:O1P:g; s:OP2:O2P:g' "$pdbfile"
        sed -i '/C7\ \ THY\ A\ \ \ 6/d' "$pdbfile"  # Fixed variable name typo
        echo "REMARK" > "a_$pdbfile"
        echo "REMARK" > "b_$pdbfile"
        awk -v a="a_$pdbfile" -v b="b_$pdbfile" '{  # Corrected variable assignment in awk
            if ($6 == 7)
                gsub($4,"URA")
            if ($5 == "A")
                print $0 >> a
            else
                print $0 >> b
            }' "$pdbfile"
        echo "END" >> "a_$pdbfile"
        echo "END" >> "b_$pdbfile"
    elif [[ "$convertTo" =~ "amber" ]]
    then
        sed -i 's:ADE:\ DA:g; s:CYT:\ DC:g; s:GUA:\ DG:g; s:URA:\ \ U:g; s:THY:\ DT:g' "$pdbfile"
        sed -i 's:C5M\ THY:C7\ \ \ DT:g' "$pdbfile"
        sed -i 's:O1P:OP1:g; s:O2P:OP2:g' "$pdbfile"
        sed -i '/C7\ \ \ DT\ A\ \ \ 6/d' "$pdbfile"  # Fixed a sed command syntax error
        echo "REMARK" > "a_$pdbfile"
        echo "REMARK" > "b_$pdbfile"
        awk -v a="a_$pdbfile" -v b="b_$pdbfile" '{  # Corrected variable assignment in awk
            if ($6 == 6)
                gsub($4," U")
            if ($5 == "A")
                print $0 >> a
            else
                print $0 >> b
            }' "$pdbfile"
        echo "END" >> "a_$pdbfile"
        echo "END" >> "b_$pdbfile"
    else
        echo "Error: second argument must be given either as \"charmm\" or \"amber\""
    fi
fi
