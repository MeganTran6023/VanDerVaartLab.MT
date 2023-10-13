
##mimic of "looper_heat.sh"

##the parts to preparing DNA sequence in the lab are - heat1,heat2,equilibriation, and repositioning H atoms

#inputs to variables based on how one types in terminal
#probably for submitting DNA sequence

seq=$1
name=$2 #name of the file of our molecule we want to simulate
dir=$3

## first job id (1)
jid1=$(sbatch -J h1$name $dir/heat1.sh $seq) #the job will rely on the specified shell script from specified directory. $seq is an argument passign through heat1.sh for it to work
jid1=$(echo $jid1 | awk '{$NF}') # prints the last column of a chart/text

## 2nd job id (2)
jid2=$(sbatch -J h2$name --dependency=afterok:$jid1 $dir/heat2.sh $seq)
jid2=$(echo $jid2 | awk '{$NF}') # prints the last column of a chart/text

## 3rd job id (3)
jid3=$(sbatch -J eq$name --dependency=afterok:$jid2 $dir/eq.sh $seq) 
jid3=$(echo $jid3 | awk '{$NF}') # prints the last column of a chart/text

## 4th job id (4)
jid4=$(sbatch -J n$name --dependency=afterok:$ji3 $dir/eq.sh $seq) 
jid4=$(echo $jid3 | awk '{$NF}') # prints the last column of a chart/text