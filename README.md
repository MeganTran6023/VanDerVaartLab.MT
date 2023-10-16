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

Annotated mimic_looper_heat.sh

* Better understood steps and purpose behind equilibriating a system for simulation

Created and annotated mimic_heating.sh

* Practice on making script that ran heating step to prepare DNA (or some other molecule) for simulation.
* Purpose of heating step - bring atoms to optimal conditions for simulation (ie appropriate velocity) and allow of accurate modelling of molecules
