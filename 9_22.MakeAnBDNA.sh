#!/bin/bash
#I made this script to Seperate a double stranded DNA to A and B strand

#1- Set input pdb file
input_pdb="practice_out.pdb"

#2- Make seperate files for chain A and B
#will output chain_A.pdb and chain_B.pdb

grep '^ATOM.* A ' "input_pdb" > chain_A.pdb
grep '^ATOM.* B ' "input_pdb" > chain_B.pdb

#use sh to run
