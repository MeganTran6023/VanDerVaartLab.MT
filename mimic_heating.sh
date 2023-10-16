#!/bin/bash

#mimic heat script

#1- Setting input and output names
## file names are theoretical and just examples
topology="toppar.top"
coordinates="coord.gro"
output_heat="heating_out" #output file after running script

#2- Heating simulation parameters
initial_temp= 310 # in K
final_temp= 455
heating_time=2000 # in ps

#3- telling script to MAKE the output directory 
mkdir -p $output_heat

#4- Performing heating simulation (edit base code as needed)

awk -v initial_temp1="$initial_temp" -v final_temp1="$final_temp" -v heating_time1="$heating_time" 'BEGIN {
	# -v means that variable is set for its corresponding variable
	printf "Initiating heating...}

END {printf "Heating step completed"}' $coord.gro > $output_heat/heating.info #outputs results of heating step in this file in this directory.