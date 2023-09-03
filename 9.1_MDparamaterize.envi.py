# python script from xerxescorrosive

#MT - This code essentially sets up the environment and parameters of a specified sequence using OpenMM. 
    ## analogous to tuning an instrument- you cannot play a song without all the strings on a violin in tune. We need the aspects of a molecule
    ## to be in check before we run a simulation on it.

#MT- This file is executed on the Linux terminal

#Further explanation will be added later - finished 9/3

#!/home/emmanuel/mambaforge/bin/python

##########################################################################
#
# Simulated the NPT ensemble
#

#MT - 1) Libraries and packages
from __future__ import print_function
from simtk.openmm.app import *
from simtk.openmm import *
from simtk import unit
from sys import stdout
import numpy as np
import sys

#MT - 2) Assigning variables
irun = sys.argv[1] #sys.srg is a list, gets first item rom lsit
sequence = sys.argv[2] #second item from list, this is our input file to feed the MD simulation
prev = str(int(irun) - 1)

#MT - 3) Setting up parameters (conditions/ features) 
temp = 300
timestep = 2.0 #MT - the time step is the discrete time interval at which the molecular dynamics simulation advances. It is measured in femtoseconds
cutoff = 1.2 #MT - threshold beyond which nonbonded interactions (e.g., van der Waals and electrostatic interactions) between atoms are considered negligible. (in nm)
printfreq = 5000 #MT - how often simulation data is printed or saved for analysis
nsteps = 10000000  # 20 ns run
nsav_rst = 1000000  # Save checkpoint file every nanosecond.MT - Checkpoints have state of simulation at specific point, simulation can be continued or reset
gamma = 5 #MT -(Langevin Thermostat Collision Frequency)  control the temperature of a system during molecular dynamics simulations.

#MT - 4) Checks for CUDA for GPU acceleration, this programming languaage enables multiple calculations to simultaneously occur such as the many graphics that come up during video games.
print('Checking for CUDA...')
platform = Platform.getPlatformByName('CUDA')
properties = {'CudaPrecision': 'mixed'}

#5)
prmtop = AmberPrmtopFile('dna-%s.prmtop' % sequence) #MT - creates parameter topology (bond length, angle) file for a DNA molecule
inpcrd = AmberInpcrdFile('noe-%s.rst' % sequence) #MT - input coordinate file (atom position, atom types, topology )for the molecular system

#6) MT- 9/2 Set up system aka the sequence and its properties itself
print ('Setting up system...')
system = prmtop.createSystem(nonbondedMethod=PME, #MT- uses Particle Mesh Ewald (PME) to calculate electrostatic interactions
    nonbondedCutoff=cutoff*unit.nanometers, #MT- program doesnt account for bonds greater than the cutoff value (length), allows GPU to save space to focus on other parts of setting up simulation
    constraints=HBonds, # MT- maintains Hydrogen bonds
    rigidWater=True, # MT - maintains distances and angles within water molecules. Allows for focusing on solute of interest and reduces computational cost
    ewaldErrorTolerance=0.00005) #MT- error tolerance for  Ewald summation method, lower number  = more accurate, but uses more memory

print('Choosing integrator...') #MT - 7) integrator solves equations of motions to setup positions and velocities of particles over time
integrator = LangevinIntegrator(temp*unit.kelvin, gamma/unit.picoseconds,
                                timestep*unit.femtoseconds) #MT - temp,collision rate,time step
integrator.setConstraintTolerance(0.000001)
system.addForce(MonteCarloBarostat(1*unit.atmospheres, temp*unit.kelvin, 25))

#8) Setting up simulation environment
print('Establishing simulation context...')
simulation = Simulation(prmtop.topology, system, integrator)#, platform, properties)

#9)
if irun == '1' and inpcrd.boxVectors is not None: #MT - sets up simulation environment using values provided for the three variables stated below (boxvectors,positions,velocities)
    simulation.context.setPeriodicBoxVectors(*inpcrd.boxVectors) #MT - xyz axies
    simulation.context.setPositions(inpcrd.positions)
    simulation.context.setVelocities(inpcrd.velocities)
else:
    with open(prev+"-"+sequence+'.chk', 'rb') as f: simulation.context.loadCheckpoint(f.read()) #MT - uses previously saved data on said parameters to open up environment for simulation

#10) Report data 
simulation.reporters.append(CheckpointReporter(irun+"-"+sequence+'.chk', nsav_rst)) #MT- save simulation every time interval defined by nsav_rst
simulation.reporters.append(DCDReporter(irun+"-"+sequence+'.dcd', printfreq)) #MT- save trajectory data as .DCD file
simulation.reporters.append(StateDataReporter(stdout, printfreq, step=True,
                                              time=True, potentialEnergy=True,
                                              kineticEnergy=True, totalEnergy=True,
                                              temperature=True, density=True, speed=True,
                                              totalSteps=printfreq, separator='\t')) #MT- outputs data for each variable of simulation to console for experimenter(s) to analyze

#MT - 11) initiates molecular dynamics simulation using number of steps defined by nsteps
simulation.step(nsteps)
