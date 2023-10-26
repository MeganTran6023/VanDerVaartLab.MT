#!/bin/bash

#MT - NOE - interactions of atoms in chemical structure gives off signals to let us know information abotu properties of chemical structure

#MT - 1st argument is our sequence file
SEQ=$1

#MT - This opens up a new document called "noe-$SEQ.in" which will store simulation parameters for a specifed sequence denoted by $SEQ
cat <<- EOF > noe-$SEQ.in
NOE
 &cntrl
  imin = 0, irest = 1, ntx = 5,
  ntb = 1, cut = 12.0, nmropt=1
  ntc = 2, ntf = 2, ig=-1, iwrap=1,
  tempi = 300.0, temp0 = 300.0,
  ntt = 3, gamma_ln = 5.0,
  nstlim = 1000000, dt = 0.002,
  ntpr = 5000, ntwx = 5000, ntwr = 5000,
 /
&wt type='REST', istep1=0, istep2=250000, value1=1.0, value2=0.1 /
&wt type='REST', istep1=250001, istep2=500000, value1=0.1, value2=0.01 /
&wt type='REST', istep1=500001, istep2=750000, value1=0.01, value2=0.0 /
&wt type='REST', istep1=750001, istep2=1000000, value1=0.0, value2=0.0 /
&wt type='END',
/
DISANG=$SEQ.RST
/
END 

EOF

#MT- "END" closes the file

#MT - sed character replacement
sed -i 's/SEQ/'"$SEQ"'/g' noe-$SEQ.in
