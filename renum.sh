#!/bin/sh

##made by xexecorrosive, annotated for informational purposes

if [ $# -ne 1 ]
then
  echo "error: pdb missing"
  
  exit
fi

##error message if user doesn't properly put in their .pdb file as firse argument when running script.
## for example, ./renum.sh aggta.pdb

awk 'BEGIN{rold="";iat=0;ires=0;};\ 
  {if($1=="ATOM"){\
     iat++;r=substr($0,24,4);if(r!=rold){ires++;rold=r;};\
     printf("%s%5d%s%4d%s\n",substr($0,1,6),iat,substr($0,12,11),ires,substr($0,27));}\
   else print;}' $1

## "'BEGIN{rold="";iat=0;ires=0;};\" rold keeps track of old residue numbers, iat keeps track of the iterations of atom numbers, and ires keeps track of residue numbers
## "iat++;" - script will go through each atom under cokumn ATOM
## r=substr($0,24,4) - extract residues 24 through 27 (use 4 because 24,25,26,27)
## if(r!=rold){ires++;rold=r;}; renumbers atoms (probably for A and B strand purposes). If residues skip numbers or start with a dif number, this script will renumber from 1 - some number without gaps.
##example: 
# ATOM    101  N   ALA    23  ...
# ATOM    102  CA  ALA    23  ...
# ATOM    103  C   ALA    23  ...
# ATOM    104  N   GLY    24  ...
# ATOM    105  CA  GLY    24  ...
# ATOM    106  C   ALA    26  ...
# ATOM    107  N   ALA    26  ...
# turns to this
# ATOM    101  N   ALA     1  ...
# ATOM    102  CA  ALA     1  ...
# ATOM    103  C   ALA     1  ...
# ATOM    104  N   GLY     2  ...
# ATOM    105  CA  GLY     2  ...
# ATOM    106  C   ALA     3  ...
# ATOM    107  N   ALA     3  ...
## the print code will then print the new, renumbered version of pdb file
