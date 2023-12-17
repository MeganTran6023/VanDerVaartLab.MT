# VanDerVaartLab.MT
Journal of code/progress as an undergraduate researcher in the Van Der Vaart Lab at USF in Computational Chemistry.

## __10/7__

Created loopbuild.sh , meganbuild.inp, and StoreSplitDNA.sh (not functional, but just to learn the basics of the code)

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

## __11/4__

* Practiced using vim
* Created aliases - keyboard shortcuts

## __11/6__
* annotated gpujob.template to better understand how code works regarding job submission.

## __11/7__
* worked with a graduate student on fixing looper_heat.sh (circe)

## __11/10__
* resolved issue regard why job was not running properly - directory to python path was incorrect.
* ran shell script to analyse parameters of DNA for production (looper_prod.sh) for XTUY

## __11/13__
* backed up run submissions for analysis w/ -r scp
* Annotated by remaking looper_prod.sh with MT_looper_prod to understand how each part of code submits jobs for analysis as well as apply stack data structures for managing files
* ran check.sh with analy.sh and XTUYdata.txt

## __11/14__
* debugged issue why runs for prod failed with graduate student
** due to syntax error in gpujob.sh

## __11/15__
* Analyzed XTUY runs (.pngs) by seeing what failed, note register shift, and successful runs after running analy.sh on DNA sequences
  
## __11/17__
* Used Visual Molecular Dynamics to see DNA sequences where uracil flipping/ register shift is observed (.dcd (frontend) and .prmtop(backend) files needed
* Edited gpujob.sh for runs 11 - 20
* Learned how to utilize "find" to organize all .dcd and .prmtop files
* sequence ATTA has potential uracil flipping, need to determine other featurse (resid, etc)

## __11/18__
* Continued to categorize simulations as fail/not fail, if register shift present in excel using Hbond and Com visuals

## __11/19__
* Updated Excel on DNA simulations (URA resid, time duration register shifts)

## __11/20__
* Updated continueXTUY.txt using ./looper_prod_continue.sh to update list of sequences that can continue running (ones that did not fail)

## __11/21-11/24__
* Updated Excel on DNA simulations (URA resid, time duration register shifts)

## __11/24__
* downloaded packages for MDanalysis on Jupyter Notebook (Python) to graph DNA simulation data
* made ipynb file "MDAnalysisTutorial_MT"

## __11/25__
* finished analysing DNA simulations not failed
* I think I incorrectly interpreted terpreted register shift, will probably revisit.

## __11/26__
* edited looper_prod_continue.txt using vim on list of successful DNA simulation runs
* made HistogramXTUY.ipynb to present data on DNA sequences with their register shift (RS) durations as well as what bases interacted during RS using Python on Jupyter NB
* 
## __11/27__
* Updated Excel on DNA simulations (URA resid, time duration register shifts) for CTTA minor

## __12/10__
* Completed Excel on DNA simulations
* Next step- code RMSD analysis of register shifts using MDAnalysis
* Code idea next steps - Bash script to improve VMD ease of use

## __12/11__
* Idea: Worked on rough idea of bash and tcl script for presetting graphical representation sfor future dcd and prmtop files for simulations
    * megan_vmd_settings.sh
    * VMD_mol_structure_settings.tcl
    * not sure if works - must test

* Completed making histograms for major and minor sequences for XTUY
  
    * These histograms record the frequency of sequences by their register shift duration times in frames.
    * Used matplotlib and pandas
    * See files "XTUY_Histogram.ipynb" for histogram code and "XTUY_Histogram.csv", "XTUY_major.csv", and "XTUY_minor.csv" for full dataset.

* Completed bar graph for major and minor XTUY sequences
    * See XTUY_BarGraph.ipynb for code
    * Compares total register shift (RS) durations of both major and minor sequences

* Next step: RMSD analysis of XTUY DNA simulations

## __12/12__
* referred to my practice script "loopDirectories.sh" to make "rmsd_looper.sh", "rmsd_minor_looper.sh", and "ref_vac_looper.sh"
    * rmsd_looper.sh and rmsd_minor_looper.sh - loops through each sequence directory to make cpptraj file for production fo reference sequence file
    * ref_vac_looper.sh - runs cpptraj scripts, makes directory to then store newly make reference files into the new directory
 
* Next step: Finish producing reference files for rest of DNA sequences, then begin RMSD analysis of XTUY DNA simulations using AMBER's Cpptraj

## __12/13 - 12/15__
* made and ran rmsd_analysis_test.sh and rmsd_analysis_test_minor.sh to run cpptraj script to produce output .txt files for RMSD analysis for all sequences.
    * runs RMSD of user input sequence directory using parm (.prmtop), reference (.nc) , and vac (.dcd) using cpptraj. User must input file sequence when running the script

* labelled all rmsd .txt graphs

* Idea: want to work on finishing loop_rmsd_analysis_test to efficiently run rmsd_analysis_test.sh and rmsd_analysis_test_minor.sh for every sequence and use the respective vac files.
------------
* Next steps:
    * See if DNA can relax using xmgrace. Turn .txt to .pngs
    * Get average RMSD of each sequence
    * Get average RMSD of ALL sequences combined + median
    * Make bar graph/ histogram of RMSD values
 
## __12/16__
* made make_dir_combo.sh to practice how to make all possible combinations of a DNA sequence as directories
    * Since in lab we work with three different RDNA combos, I did XUAY, XUBY, and XUCY as test names

## __12/17__
* made loop_print_rmsd.sh to get average RMSD of each DNA sequence. Calculated by using sum of RMSD values divided by total number of rows. 
