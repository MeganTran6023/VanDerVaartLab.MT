#!/bin/bash                                                                                                            

#this replaces thymines with Uracil in sample .pdb file

#If DT is present in column 4, replace with U                                                                          
awk '$4 == "DT" { $4 = "U" } 1' cgcgactacgcg_copy.pdb > cgcgactacgcg_copyOUT.pdb

#issue- spacing is messed up - 10/4 MT   
