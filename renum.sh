#!/bin/sh

##made by xexecorrosive, annotated for informational purposes

if [ $# -ne 1 ]
then
  echo "error: pdb missing"
  exit
fi

awk 'BEGIN{rold="";iat=0;ires=0;};\
  {if($1=="ATOM"){\
     iat++;r=substr($0,24,4);if(r!=rold){ires++;rold=r;};\
     printf("%s%5d%s%4d%s\n",substr($0,1,6),iat,substr($0,12,11),ires,substr($0,27));}\
   else print;}' $1
