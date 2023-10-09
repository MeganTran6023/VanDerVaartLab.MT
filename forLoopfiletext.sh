###My attempt###

#!/bin/bash

#this makes a directory

#mkdir "Sample"

#cd "Sample"

#mkdir "Sample_a" "Sample_b" "Sample_c"

#insert some .txt file in each directory


## list out each directory 
#for x in "Sample_a" "Sample_b" "Sample_c:
#	do
#	cd $x 
	
	#This adds text in our sample text file before adding the txt file in each sample a,b,c directory in Sample directory
#	echo "This is a sample text file" > sampletext.txt

## leave directory

#	cd ..
#done

#echo "Work complete!"

###Correct Work###
#!/bin/bash

# Create a directory called "Sample"
mkdir "Sample"
cd "Sample" || exit 1

# Create directories "Sample_a," "Sample_b," and "Sample_c"
mkdir "Sample_a" "Sample_b" "Sample_c"

# Loop through the subdirectories and create a sampletext.txt file in each
for dir in "Sample_a" "Sample_b" "Sample_c"; do
    # Navigate into the directory
    cd "$dir" || exit 1
    
    # Create a sampletext.txt file with some content
    echo "This is a sample text file" > sampletext.txt
    
    # Navigate back to the parent directory
    cd ..
done

echo "Directories and .txt files created!"
