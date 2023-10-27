#!/bin/bash


##looks into dcd file
output=$(./read_dcd_frames.xf90)
frames=$(echo "$output" | "Number of frames:" | awk '{print $4}')

##see if there are 2000 runs in dcd file
if [[ $frames -eq 2000 ]]; then
	echo "Complete"
else
	echo "DCD does not have 2000 frames"
fi