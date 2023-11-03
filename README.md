# VanDerVaartLab.MT
Journal of code/progress as an undergraduate researcher in the Van Der Vaart Lab at USF in Computational Chemistry.

## __10/7__

Created loopbuild.sh , meganbuild.inp, and StoreSplitDNA.sh

* StoreSplitDNA.sh - script to split each DNA strand made in directories of desired DNA mutations
* meganbuild.inp - basic build template to paramaterize each DNA strand made
* loopbuild.sh - apply the template "meganbuild.inp" to each of the strands made from StoreSplitDNA.sh 

## __10/9__

Created forLoopfiletext.sh

* Practiced making shell script that make directories within a directory using for loop - applicable to making build, prod, and heat file switching each type of DNA mutation

## __10/11__

Created newmimiclooper2.sh

* Practiced making files of a change in a string sequence that contain certain files and loop it through each existing directory in my terminal

## __10/13__

Created and annotated mimic_looper_heat.sh

* Practice on making script that ran multiple jobs simultaneously to prepare DNA for simulation.

## __10/15__

Created and annotated mimic_heating.sh

* Practice on making script that ran heating step to prepare DNA (or some other molecule) for simulation.
* Purpose of heating step - bring atoms to optimal conditions for simulation (ie appropriate velocity) and allow of accurate modelling of molecules

## __10/16__

Annotated mimic_looper_heat.sh

* Better understood steps and purpose behind equilibriating a system for simulation
* Submitted job for XCUY - failed


## __10/18__

Annotated convertRESname.sh

* Better understood bash (sed and awk) in converting keywords in a given .pdb file to appropriate keywords for programs CHARMM and AMBER

## __10/20__

Annotated renum.sh and mutate.sh

* Better understood awk in context of renumbering values under a column given a pdb file to properly format a and b DNA strands (renum.sh)

## __10/23__

Finished annotating mutate.sh

* Better understood awk and sed in context of making a certain uracil base mutation in a DNA strand 

## __10/24__

Worked on submission script for XUCY - edited npt.py and looper-prod.sh

* Learned how to debug issues that prevented the runs from successfully completing

## __10/26__

* Annotated make_noe.sh to better see application of text replacement and AMBER simulations

## __10/27__

* Annotated checkframe.sh to see how to check dcd file by seeing if there are 2000 runs in dcd file
* Assigned task: make script that loops through each directory and checks each .out files if complete or not. Resubmit incomplete .out files and submit next iteration of completed files.

To practice this, I am making a theoretical situation that mimics this to practice writing the appropriate shell scripts. 

1) Make Directories FileA, FileB, FileC

2) Made shell script loopDirectories.sh that added a sample ".out" file to each directory.

3) (In progress) - make script that checks if .out is complete or not.

## __10/29__

1) Worked on loopDirectories.sh step 3 from 10/27. This part is complete.


## __11/2__

1) Worked on loopDirectories.sh step 3 , coded on how to use a different shell script and incorporate it into another shell script. This is useful when running a shell script in the lab that loops through each directory and runs another shell script to submit jobs for each of the looped directories.

## __11/3__

* Worked on running looper.sh in DNA mutation XCUY while editing gpujob.sh and gpujob.template to ensure looping and job submission.
