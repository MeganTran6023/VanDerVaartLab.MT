# VanDerVaartLab.MTJournal of code/progress as an undergraduate researcher in the Van Der Vaart Lab at USF in Computational Chemistry.

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
* made loop_print_rmsd.sh to get average RMSD of each DNA sequence. Calculated by using sum of RMSD values divided by total number of rows. Output .txt file with RMSD data

## __12/18__
* made histograms of sequences from txt files from loop_print_rmsd.sh on Jupyter NB using Python. See Histogram_Major_RMSD.ipynb for code

![image](https://github.com/Sonicdaheghod/VanDerVaartLab.MT/assets/68253811/70c10336-08f0-4a91-9ba1-c964f85d661e)

![image](https://github.com/Sonicdaheghod/VanDerVaartLab.MT/assets/68253811/063e3e66-1568-40c7-90cb-fa3c0c6dfe89)

* need to redo RMSD data because relaxation time must be accounted for. Relaxation time is when the simulated RDNA is most adpated to the environment it is in during simulation. Here, the base interactions that complementary base has with the bases above and below the flipped uracil base.

## __12/19__
* Editing RMSD data by viewing images using xmgrace to get RDNA relaxation state.

![image](https://github.com/Sonicdaheghod/VanDerVaartLab.MT/assets/68253811/4e334ac5-5ece-4aa2-8731-9268edfbcbef)

Image: If RMSD is shooting up before reaching equilibrium, we delete that time since that time period is not when RDNA is in production.

* Need to update RMSD values for TTTT and TTTG tomorrow. Editied RMSD_avg_looper_calculation_block1.sh and RMSD_avg_looper_calculation_block2.sh to take in new RMSD values after acounting for relaxation time.

## __12/20__
* Updated TTTT and TTTG rmsd data.
* Updated Histogram_Major_RMSD.ipynb.

![image](https://github.com/Sonicdaheghod/VanDerVaartLab.MT/assets/68253811/8e0282ab-7e4e-4a3b-bc58-6cddcb1ec422)

![image](https://github.com/Sonicdaheghod/VanDerVaartLab.MT/assets/68253811/445c8f3f-ff71-4eb1-85d5-6acbc3248cfe)

* Worked on improving looping scripts with make_path2_dir.sh. 

![image](https://github.com/Sonicdaheghod/VanDerVaartLab.MT/assets/68253811/95a5b7d6-77cc-459c-825c-1624c4e78586)

**Outcome**: made directory path2 in each subdirectory of XUAY and made sample_rmsd.txt_output.txt which is the file that has specific lines omitted from the original sample_rmsd.txt file

~~need to redo BarGraph_Major_RMSD.ipynb since total number of rows was off by 1, edited by doing NR -1 in shell script when calculating average RMSD.~~

## __12/21__
* Made XTUY_minor_block1and2_newout.sh to loop through minor sequences.
    * gets lines 298 to end of .txt file of minor seq block 1 and 2 after cpptraj submission RMSD using print_rmsd_minor_block1.sh and print_rmsd_minor_block2.sh.
    * Output files are block1rmsd_minor_output.txt and block2rmsd_minor_output.txt.
 
* Made histogram for minor sequences using python on Jupyter NB - Histogram_Minor_RMSD.ipynb

![image](https://github.com/Sonicdaheghod/VanDerVaartLab.MT/assets/68253811/7ed4c22d-cddf-4293-8afc-bbcdf9ba9e38)

![image](https://github.com/Sonicdaheghod/VanDerVaartLab.MT/assets/68253811/cc27efff-3501-440c-bf7b-6cea8a6b784d)

**Next Steps:**
* get average RMSD of all 32 sequences (both major and minor together, two dif calculations for block 1 and 2)
* get median value from all 32 sequences, two dif median values due to block 1 and 2.


Note: purpose of block 1 and 2 for RDNA simulation is to compare behavior of strand A and B during the run and how they deviate from the reference RDNA strand made 

## __12/22__
* combine_singleFile_MajorandMinor.sh ->
    * code for theoretical test environment befor eapplying it to my project in the lab hence the directory and file names
    * finds and combines every specific .txt file that exists in each subdirectory into on e.txt file, output file in provided subdirectory
    * deletes any extra empty lines that exists in the seperate .txt files
    * Something to note - in base_directory="/Playground_MT/XUAY", may have to remove the first part of path depends on situation. This was the case when applying this base code to my actual XTUY project
* completed median_avg_rmsd_COPY.sh
      
    * combines all major and minor into block 1 and block 2 own seperate txt files (output file at ${dir_name}/all_block1_rmsd.txt and ${dir_name}/all_block2_rmsd.txt )

    * finds average values for block1 and 2 from output files and median

    * output file for this shell is rmsdAvg_block1and2_total.txt
 
![image](https://github.com/Sonicdaheghod/VanDerVaartLab.MT/assets/68253811/fa9c7d41-5248-4278-9f0c-ef3a1a86deb4)

**Next Steps:**
* ~~Bar graph above data~~
* ~~Study code made yesterday (median_avg_rmsd_COPY.sh)~~

## __12/23__
* plotted averages and medians for block 1 and 2 in AvgMedian_Block1and2.ipynb of all major and minor sequences combined for respective blocks.

![image](https://github.com/Sonicdaheghod/VanDerVaartLab.MT/assets/68253811/805159e2-391f-42ec-8246-3c0881cedb15)

![image](https://github.com/Sonicdaheghod/VanDerVaartLab.MT/assets/68253811/63570490-c4b9-458e-a640-c0b2299cc843)

**Analysis:**
* Huge difference in average vs median value for block 2.
* Which one is better measure? Block 2 was not as normally distributed compared to block 1 dataset (has outliers) -> use median. Block 1 dataset was normally distributed -> use average(?)

**Next Steps:**
* Work on GC sequences
* Write out general outline of steps (VMD to RMSD)

_Question_ -  what are we changing with AT and GC? bond with uridine?

## __12/24__

**Step 1 - submit jobs**
1. Run looper_heat.sh
2. After 1 finishes, submit looper_prod.sh

1. .inpcrd (Input Coordinates):
    * Purpose: Contains the initial coordinates of the atoms in molecular system.
2. .prmtop (Parameter Topology):
    * Purpose: Contains information about the molecular system's topology and force field parameters.
3. .rst7 (Restart Coordinates):
    * saves coordinates of system at particular point so one can go to system at certain time of simulation.
    * these are made in intervals during a whole simulation
4. .nc (NetCDF format) *(.dcd can be used as alternative)*:
    * .nc files may store trajectory data, such as the coordinates of atoms over time.

Generally, .dcd and .prmtop files used to visualize simulated sequence on VMD.

**Issues encountered-**

* .nc file wouldn't be read by VMD
    * Solution: run cpptraj script convert .nc file to .dcd

 * cpptraj file doesn't process parm and trajin files
    * Solution: provide full path
  
* Jobs wouldn't submit when running looper_heat.sh
  * Solution: worked with grad student to edit queue used and comment out certain lines
  * Files used: (update later)

**Next Steps:**
* squeue -u (id)
* see why those lines were commented out on looper_heat and heat.sh
* run gpujob.sh

## __12/25__
* annotated annotatelooper_heat.sh and heat.sh to see how they worked - why I made edits to them yesterday
* looper_heat.sh jobs submitted yesterday still running

## __12/27__
* heating jobs completed, began running productions on all sequences

**Production**
 
* Prod step takes 48 hrs (2 days)
* Analysis every 100ns on snapshots 1 - 10s
* 1 snapshot = 20 ns of simulation
* 148 ns ran / day -> around 7 snapshots for analysis per day

Files used for looper_prod.sh:
    
    cp $projectDir/npt.py .
    cp $projectDir/gpujob.sh .
    cp $projectDir/gpujob.template .
    cp $projectDir/center_desol_merge.temp .
    cp $projectDir/analy.sh .
    cp $projectDir/eof.temp .
    cp $projectDir/vacgethbondcom.py .
    cp "$base_path/dna-${sq}-$subd.prmtop" .
    cp "$base_path/noe-${sq}-$subd.rst" .


| Problems  | Solutions |
| ------------- | ------------- |
| looper_prod.sh was not running sequences | reset irun to 1 on npt.py |
| looper_prod.sh could not find the prod/major and prod/minor files| made shell script to make those directories in each subdirectory of XTUY (make_prod_COPY.sh)  |
| npt.py had depreciated simtk.openmm   | looked through openmm website for utd version  |

**Next Steps:**
* View major and minor GC sequences on VMD

**Notes about simulation procedures:**

| Steps  | Description |
| ------------- | ------------- |
| Input System | make DNA strands using AMBER and CHARMM (.pdb) |
| Solvation | simulate system in a defined container filled with solvent in water (most prevalent in nature, shows most accurate results) |
|  | |
| Adding Ions | Neutralize the system to stabilize it and mimic body salt concentration |
| Minimization | - prepare starting material by relaxing it|
|  | - avoids steric clashes (overlapping of nonbonding atoms)/ inapproporiate geometry|
|  Heating + Equilibriation | - prepare system at desired temp for our simulation (heating) |
|  | - set system at desired pressure, relax it , at optimal conditions |
| | - analogous to thawing out food before cooking/ preheating oven or even washing vegetables before making salad|
|  Production | - removing contraints place on system from previous steps and initiate simulation  |
| | - analogous to releasing animal to wild after testing it in lab environment (ie remove tags and etc) 
|  Relaxation Time | Remove time record where system has not yet acclimated to conditions of simulation run  |
|  Statistical Analysis | - Root Mean Square Deviation (RMSD) |
| | - average RMSD for each sequence for each block, and then combine major and minors in block 1 and find that average, same process for block 2  |
|| - median for all sequences block 1 and 2  |
|| - Visualize using python matplotlib and numpy |

## __12/28__
* made cpptraj_input.sh to work on looping for seq inputs for cpptraj script

![image](https://github.com/Sonicdaheghod/VanDerVaartLab.MT/assets/68253811/99fc999e-eef5-4e2d-9b7e-0faaae30ed00)

## __12/29__

Made a shell script combining smaller shell scripts in an attenpt to run production an danalysis efficiently 

I still have copies of the individual shell scripts that worked

* combo_rmsd_looper_analysis.sh
    * combine EOF of rmsd_looper.sh and rmsd_minor_looper.sh, also successfully inputted subd names into sequence via looping (cgcg(dir)cgcg) into cpptraj scripts
    * use directory name to plug into cpptraj script to run the rmsd analysis
    * loops through each subdirectory of XTUY (or whatever the input is) (cgcg(seq)cgcg)
    * loops through each subdirectory and prints out the highest number vac file ending in .dcd. and replace the vac files needed for respective cpptraj analysis scripts

* combo_RMSD_seq_avg_block1and2_COPY.sh
    * gets all RMSD values from cpptraj output
    * combo of RMSD_avg_looper_calculation_block1.sh and RMSD_avg_looper_calculation_block2.sh as well as its minor counterparts
    * finds average of EACH sequence (major and minor, block 1 and 2) -> output file in seperate txt files
    * finds avg and median of all sequences combined (for block 1 and block 2)

**Next Steps:**
* Gather and download all Com (center of mass) and Hbond pngs to analyze on vmd

## __12/30__

* made move_Hbond_Com_files_looper.sh
    * goes through each subdirectory and copies Hbond and Com files
    * moves the copy version into directory GC_Hbond_Com in  GC_XTUY
    * makes downloading images efficient
  
## __12/31__

* Analyze pngs of Com and Hbond from production runs to see any register shifts

**Register Shift (RS)**
  <p align="center">
  <img src="https://github.com/Sonicdaheghod/VanDerVaartLab.MT/assets/68253811/8fc041bb-b88c-49b5-a7f2-45ae7cf249f2" >
  <img src="https://github.com/Sonicdaheghod/VanDerVaartLab.MT/assets/68253811/33a44551-5a94-4b0f-b081-6eb353c64c02" >
</p>

citation: Paul B. Orndorff and Arjan van der Vaart
Journal of the American Chemical Society 2023 145 (30), 16350-16354
DOI: 10.1021/jacs.3c05890

* Essentially this is when the base originally supposed to bind with the uracil that is flipped out binds with a base above or below uracil.

* Significance:
  <p align="center">
  <img src="https://github.com/Sonicdaheghod/VanDerVaartLab.MT/assets/68253811/ed08a14e-5ce7-4544-b370-5c469ae27750" >
</p>

Analyzing prod simulations for RS:

* Example of RS

  <p align="center">
  <img src="https://github.com/Sonicdaheghod/VanDerVaartLab.MT/assets/68253811/808a5d76-8d8d-4610-8477-4276f36b1fa3" >
  <img src ="https://github.com/Sonicdaheghod/VanDerVaartLab.MT/assets/68253811/b0571b19-0424-46a7-813d-b2e70d6aea73">
</p>

  * The uracil (orange) is flipped out, the base originally binding with uracil (ice blue) connects with the base above uracil (purple).

* Hbond and Center of Mass graphs:
  <p align="center">
  <img width="960" alt="image" src="https://github.com/Sonicdaheghod/VanDerVaartLab.MT/assets/68253811/0264447b-74e5-4e70-afa2-4761681ed87c">
</p>

 | Hbond Graph  | Com Graph |
| ------------- | ------------- |
| in red box in attached image, shows if the base complimentary to uracil bonds with base above/below uracil | distance in angstrom of respective base from base complimentary to uracil |

**Questions:**

 | Q  | A |
| ------------- | ------------- |
| Can RMSD have more than one relaxation time? | no, mainly occurs in beginnin gof RMSD graph. Any other instances of this would be due to outside factors such as issues in simulation conditions, the starting material, not enough time for system to equilibriate |
| What is block 1 and block 2? (more than just strand A and B) | compare the RMSD (root-mean-square deviation) of two specific blocks within simulated DNA helix to a reference DNA strand. |
| What is the mechanism behind uracil flipping? | 1- UDG uses flexible loops made of proline and glycine-serine residues to pinch area with uracil |
||2 -UDG's intercalation loop wedges into loop with uracil, destabilizes it, and pushes uracil out so it "flips out"|

## __12/30__

* continued to analyze simulation runs of DNA afer production

## __12/31 - 1/2__
see 12/30

**Questions:**

 | Q  | A |
| ------------- | ------------- |
| What is the purpose of this experiment? |-------------|

## __1/3__
* Finished analyzing DNA sequences simulation for GC pairs
* Next step: Submit ContinueXTUY.txt for sequences of interest
    * simulations that have register shifts
    * did not fail (URA did not flip in)
* Errors in combo_rmsd_looper_analysis.sh (inevitable)
  * need full pathway when inputting .prmtop and other necessary files for cpptraj scripts
  * fixing code to provide correct path since naming is different for these sequences
  * resolved issue with processing prmtop, now working on .ncrst
  <p align="center">
  <img width="960" alt="image" src="https://github.com/Sonicdaheghod/VanDerVaartLab.MT/assets/68253811/fcab3aa5-83cf-4dbb-bf50-6b11add8c76b">
</p>


## __1/4__

* resolved issue with processing inputs to make reference sequence file (.nc) for RMSD analysis both major and minor

  <p align="center">
  <img width="960" alt="image" src="https://github.com/Sonicdaheghod/VanDerVaartLab.MT/assets/68253811/43658cd9-b242-40d3-b928-8bc48869a010">
</p>

* when running cpptraj script for reference nc files. remember to label output nc files with major/minor!
* successfully ran rmsd_analysis_test_updated_COPY.sh to run RMSD analysis on DNA sequences
    * edited code to output .txt files into respective directories (major/minor)
 
* **work on looper_prod_continue.sh to submit sequences to be continued**

Issues resolved CONTINUE RUNS:

* gpujob.sh did not run sequences to continue production run
    * Solution: in continueXTUY.txt, must add "-major" or "-minor" after 4 letter sequence
  <p align="center">
  <img width="300" alt="image" src="https://github.com/Sonicdaheghod/VanDerVaartLab.MT/assets/68253811/7144d532-750b-414c-ae8b-15dc76d860c70">
</p>

**Steps to view rmsd .txt files:**

1) Import "module load apps/grace/5.1.22"
2) xmgrace (filename) 

**In each subdirectory:**

| Files  | Purpose |
| ------------- | ------------- |
| block(#)_major(or minor)_rmsd.txt | original file of rmsd from cpptraj run |
| block(#)_major(or minor)_rmsd_output.txt | edited file of rmsd from cpptraj run (identify relaxation times) |
| block(#)_major(or minor)_rmsd_output_COPY.txt | copy of edited file of rmsd from cpptraj run (identify relaxation times) |

* delete a range of lines on vim:
    * :5,10d
    * 5 is th ebeginning point, 10 is the end point
    * finished ATCC

## __1/7__

* Analysis didnt run on the three sequences that need to be continued
* Reason: didnt uncomment analysis line in my looper_prod_continue.sh

* now on CTCA

## __1/8__

* contraints messed up on UT sequences
* start working on ATCG
* after find relax time, fix excel table

## __1/9__

* all except major block 1 have obvious indication of relaxation times
  <p align="center">
  <img width="900" alt="image" src="https://github.com/Sonicdaheghod/VanDerVaartLab.MT/assets/68253811/8b190d98-ea4c-4ac0-b645-1087de5570fc">
</p>

Image: Red box = relaxation time begins for block 2 minor rmsd ATCG

* start on CTCT for tomorrow

## __1/10__
* finished CTCT
* start working on CTCG
* TTCT continue run in progress

## __1/11__

* prepared presentation for lab meeting

## __1/12__

<img width="38" alt="image" src="https://github.com/Sonicdaheghod/VanDerVaartLab.MT/assets/68253811/d878707a-5d74-4547-a96d-3abf3ef9b569">

## __1/13__

![image](https://github.com/Sonicdaheghod/VanDerVaartLab.MT/assets/68253811/edc7af27-eedb-4f5b-a4af-af034c4a6029)

## __1/14__

* copied UT_flip.tar.gz and new looper_heat.sh into uridine_flip/XTUY
* ran looper_heat.sh for new UT sequences on new partition (simmons_i) - around 2-3 days to finish
* follow steps 12/25 - 12/27 in log

## __1/15__

Submitted production runs for UT

  <p align="center">
  <img width="900" alt="image" src="https://github.com/Sonicdaheghod/VanDerVaartLab.MT/assets/68253811/c4ab8518-01b3-4154-9a75-fcdb8c0f1c64">
</p>


| Problems  | Solutions |
| ------------- | ------------- |
| looper-prod.sh was not running all UT sequences | exit 0 in code was only running first sequence it saw; deleted so all sequences could be run |
| looper-prod.sh - analy.sh wasn't being read | use complete pathway (didnt work,tried to run analy.sh outside of script |
| | angle.sh seems to be the issue |

**Next Steps**
* find easier way to import necessary files to run looper_prod
DONE

## __1/16__

Successfully Submitted production runs for UT

| Problems  | Solutions |
| ------------- | ------------- |
| looper_prod.sh was not running sequences | reset irun to 1 on gpujob.sh |
|  | cp necessary files from analyscript |

## __1/17 - 1/19__

* finished production run for UT sequences- now analyze on VMD
* downloaded CHARMM and X3DNA on remote server

| Problems  | Solutions |
| ------------- | ------------- |
| not all sequences ran through as job submissions | use looper_prod_continue.sh and fill out respective .txt file |
| ATTA major simulation didnt match with Hbond / COM  png | rerun analy.sh (noticed simulation for vac1 matched results from images)|

## __1/20__

* made loop_tpl.sh
* for com PNG, the center of mass is on the base originally paired with uracil.
* ![image](https://github.com/Sonicdaheghod/VanDerVaartLab.MT/assets/68253811/9b9e5f10-9d98-4a67-ac57-762b360edfd7)

***ATTC major observations*** : whole DNA seq tilts clockwise  (looks like glitch?) as register shift with below ura C-A occurs 

R.S base (ura flip) from 5-3 end, bind with adenine on 3-5 end

stop at 10k frames (vac1)

 ***Reading***: Neighbor List Artifacts in Molecular Dynamics Simulations
Hyuntae Kim, Balázs Fábián, and Gerhard Hummer

- learning more about molecular dynamics and potential problems in simulations

## __1/25__

* looper_analysis for psf - fixed preceeding isues by using full file directory
Current error in create_psf.py:
    prmtop_file=f'vac_{}.prmtop'.format(seq)
                               ^
SyntaxError: invalid syntax

| Problems  | Solutions |
| ------------- | ------------- |
|Current error in create_psf.py:
    prmtop_file=f'vac_{}.prmtop'.format(seq) | conda activate openmm7.6 |
| create_psf.py isnt finding the nc file | maybe put full path directory? |

## __1/28__

* made histogram of successful register shifts GC sequences (XTCY where T is mutated to uracil):
    * GC_XTUY_Histogram.ipynb
    * GC_XTUY_Major.csv

  <p align="center">
  <img src="https://github.com/Sonicdaheghod/VanDerVaartLab.MT/assets/68253811/d1efe168-9e58-47e6-8a1f-d1eb19eef78d" >
</p>

* upload looper_psf.sh!!
    * loops through sequeence subdirectories and puts psf2.sh, looper_analysis_psf.sh, create_psf.py, continueXTUY.txt, BPS.template, looper_analysis_continue.sh, and analy_continue.sh

* run looper_prod for major sequences for UT (XTUY, T is mutated and the U is thymine)
* idea: need to write looper to make psf folders in python
    * i had to use x terminal for python to work, directly with create_psf.py

| Problems  | Solutions |
| ------------- | ------------- |
| vmd script for psf (create_psf.sh) not work | grad student edit with "echo" |
| x3DNA download| have to edit ~/.bashrc then source it |
| charmm not working| check charm directory path |

''' export X3DNA='/home/m/xxxxx/x3dna-v2.4'
export PATH='/home/m/xxxxx/x3dna-v2.4/bin':$PATH '''


__rsync:__
rsync -aurv --include={"*.sh","*.inp","vac*","BPS*"} --exclude="*.*" /work_bgfs/xxx/xxx/uridine_flip/GC_XTUY/XTUY .

__Next steps:__
* analyze new UT_major sequences vmd
* 

## __2/1__

* acquired .dat file for sequences and its properties
    * in "prod/major(or minor)/an" folder

  <p align="center">
  <img src="https://github.com/Sonicdaheghod/VanDerVaartLab.MT/assets/68253811/9e278f33-198d-4bcc-a120-0467a1fe6986" >
</p>

Sample view of VAC-CGCGGTCTCGCG-MAJOR-shift-slide-rise-tilt-roll-twist.dat  
![image](https://github.com/Sonicdaheghod/VanDerVaartLab.MT/assets/68253811/3a23e225-0b7b-40d2-b0a6-a37ea077882c)

| Property  | Explanation |
| ------------- | ------------- |
|Shift |	Shift describes how much one base pair moves left or right compared to the next along the DNA helix. Think of it as the lateral displacement of one base pair relative to another.|
|Slide |	Slide measures how much one base pair shifts up or down relative to its neighboring base pair in the helix. It's like the vertical displacement of one base pair compared to another.|
|Rise |	Rise is the distance between two neighboring base pairs along the DNA helix axis. It's like measuring the height between steps in a staircase.|
|Tilt	| Tilt is the angle at which each base pair's flat plane deviates from being perfectly perpendicular to the helical axis. It's like tilting a book on a shelf.|
|Roll	| Roll describes the rotation of one base pair with respect to its neighboring base pair along the helix axis. It's like twisting a rope along its length.|
|Twist |	Twist is the rotation of one base pair's flat plane relative to the next base pair's flat plane along the helix axis. It's like the twist in a spiral staircase.|

**.dat files explanation in work/...**

angles/VAC-CGCGGTCTCGCG-MAJOR-total-bend-tilt-roll-vecang.dat: This file likely contains data on the bending, tilting, and rolling angles of the DNA backbone. You might find it in a directory named "angles" within your simulation or analysis output folder.

backbone/torsion/VAC-CGCGGTCTCGCG-MAJOR-torsion.dat: This file probably contains information about the torsion angles of the DNA backbone. Look for it in a directory named "backbone/torsion" in your output folder.

backbone/torsion/VAC-CGCGGTCTCGCG-torsion-dist.dat: This file may contain data related to the distribution of torsion angles along the DNA backbone. You should find it in the same directory as the previous file.

backbone/sugar_conformation/VAC-CGCGGTCTCGCG-pseudobond-dist.dat: This file likely contains information about the distances between atoms in the sugar moiety of DNA. Check for it in a directory named "backbone/sugar_conformation".

backbone/sugar_conformation/VAC-CGCGGTCTCGCG-MAJOR-pseudobond-dist.dat: Similar to the previous file, but specific to a major groove conformation.

backbone/sugar_conformation/VAC-CGCGGTCTCGCG-MAJOR-puckering.dat: This file probably contains data on sugar puckering conformations in the major groove of DNA. Look for it in the "backbone/sugar_conformation" directory.

backbone/sugar_conformation/VAC-CGCGGTCTCGCG-puckering.dat: Similar to the previous file, but likely containing data for both major and minor grooves.

bp/VAC-CGCGGTCTCGCG-MAJOR-shear-stretch-stagger-buckle-propeller-opening.dat: This file might contain measurements related to base pair parameters such as shear, stretch, stagger, buckle, propeller, and opening. You should find it in a directory named "bp".

grooves/VAC-CGCGGTCTCGCG-MAJOR-grooves.dat: This file likely contains information about the dimensions and characteristics of the major and minor grooves in the DNA structure. Check for it in a directory named "grooves".

steps/VAC-CGCGGTCTCGCG-MAJOR-shift-slide-rise-tilt-roll-twist.dat: This file probably contains data on the shift, slide, rise, tilt, roll, and twist parameters for each base pair step in the DNA structure. Look for it in a directory named "steps".

tpl/VAC-CGCGGTCTCGCG-MAJOR-total-twist.dat: This file may contain data on the total twist of the DNA structure. You might find it in a directory named "tpl".

Tasks:

* continue XTUY major sequence
* run cpptraj nc files? XTUY major

## __2/3__

* mismatch prmtop and chk files when running looper_prod_continue.sh
* Solution: it was in work and not work_bgfs

UT_major -> work

## __2/4__

**Structural Analysis**

| Steps  | Description |
| ------------- | ------------- |
| run loop_psf.sh (In GC_XTUY)|  loopers create_psf.sh in each subd |
| create_psf.sh (In GC_XTUY/XTUY) | makes psf files using vmd for all subdirectories|
| need: steps.sh (In GC_XTUY/XTUY) | |
| need: analysis_looper.sh (In GC_XTUY/XTUY) | |
| need: submit_analysis.sh (In GC_XTUY/XTUY) | |
| need: BPS.template (In GC_XTUY/XTUY) | |
| need: tpl_bpl_steps.sh and .inp (In GC_XTUY/XTUY) | |
| run looper_data_extract.sh (In GC_XTUY/XTUY) | gets necessary files and runs for structural analysis|

* worked on looper_structural_analysis.sh to get averages of structural parameters of sequences (in work/m/...)

## __2/5__

*got looper_structural_analysis.sh to get averages to put specific parameters in seperate files

## __2/7__
* structural analysis on UT_Major sequences
* compiling charmm in progress
* worked on visualizing data for GC_XTUY on Jupyter NB

## __2/8__

Rerun analysis on vac4 sequences

This is for XTUY (UA) minor sequences in /XXXX/XXXX/XXXX/uridine_flip

![image](https://github.com/Sonicdaheghod/VanDerVaartLab.MT/assets/68253811/3cac202b-e4bb-4631-b4a9-0b74fa0b7482)

__Tasks:__
* Rerun analysis on GC XTUY - major and minor, and TU XTUY major (in UT_flip)

## __2/9__
* uploaded Structural Analysis GC_XTUY.ipynb - bar graphs of strucutral parameters as discussed above
* resubmitted looper_analysis.sh for sequences:
* 
![image](https://github.com/Sonicdaheghod/VanDerVaartLab.MT/assets/68253811/3cac202b-e4bb-4631-b4a9-0b74fa0b7482)
* looper_analysis: vacgethbond and continueXTUY.txt and analy.sh

* in GC, looper_analysis is looper_analysis_2_9.sh
* GC sequences to run analysis:
Major: CTCC,GTCT,TTCT

* look at UT major sequences continued run on vmd 

## __2/10__
TU sequences :
* CTTA
* CTTC
* CTTT
* GTTA
* GTTT
* TTTC

When running new looper_prod_continue.sh, make sure to not rerun from same vac number or else you lose data.

* new looper_prod_continue.sh
* TU - major  sequences in /uridine_flip/UT_flip
* isssue with looper_data_extract.sh -> need to complie charmm
do "sbatch -J compcharmm /home/XXX/XXX/charmm/c43b2/compilecirce.temp"

## __2/11__
Tasks completed:
* ran up to vac 6 for TU sequences above for further analysis in work_bgfs directory
* ran torsion.sh on GC sequences in work directory -> important for seeing how register shift affected bases outside of site where register shift occurs?
* on torsion.sh output file, 2nd column is average 3rd column is standard deviation


| Torsion Angle | Description                                           |
|---------------|-------------------------------------------------------|
| Alpha (α)     | Rotation around the O3'-P bond                       |
| Beta (β)      | Rotation around the P-O5' bond                        |
| Gamma (γ)     | Rotation around the C4'-C5' bond                      |
| Delta (δ)     | Rotation around the C3'-O3' bond                      |
| Epsilon (ε)   | Rotation around the C2'-C3' bond                      |
| Zeta (ζ)      | Rotation around the C1'-C2' bond                      |
| Chi (χ)       | Rotation around the N1-C1' bond for pyrimidines       |
|               | Rotation around the N9-C1' bond for purines           |


Next tasks:
* look VMD 6 UT sequences
* run puckering.sh for GC in work
* python chart for torsion data

## __2/11__
Tasks completed:
* reran up to vac 6 for TU sequences above for further analysis in work_bgfs directory (remove simtk in openmm in npt.py)
* ran puckering.sh
* got charmm submission for .dat file production to work
    * fix charmm directory
    * look in compilecharmm.temp for modules
    * cd

| Q | A                                           |
|---------------|-------------------------------------------------------|
| What is DNA puckering?     | 
DNA puckering, by providing structural flexibility, aids in register shifts where bases may flip outside the helix, enabling adjacent bases to form alternative base pairings, thus maintaining DNA stability and functionality.     |

## __2/13__
Tasks completed:
* reran up to vac 6 for TU sequences above for further analysis in work_bgfs directory (add simtk in openmm in npt.py "from simtk import unit")

* turns out the txt file had minor instead of major -> rerunning for majors looper_prod_continue.sh

## __2/14__

* GC sequences to analyze data
minors: CTCT,ATCT
majors: GTCT,TTCC,CTCC,TTCT

* started script to get .dat files for torsion to plot on graph
    *extract_torsion.sh

## __3/8__
* ./XTUY/GTTG/build/data/minor/dna-cgcggttgcgcg-minor.prmtop

## __5/9__

I am wrapping up the Uracil-Flipping DNA project and will be leaving this lab to work in Dr. Templeton's Lab on Machine Learning with COncussion Patient Dataset.
