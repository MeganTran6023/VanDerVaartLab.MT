#Creating new DNA strand

#Package used: Ambertools23
#Terminal: Linux
#Language: Shell

#Step 1: Create DNA and save it as .pdb file
fiber -seq=GCGCTTGCTTGCTTGCG TTGC.pdb

#Step 2: Open file using program Visual Molecular Docking (VMD)
vmd TTGC.pdb
