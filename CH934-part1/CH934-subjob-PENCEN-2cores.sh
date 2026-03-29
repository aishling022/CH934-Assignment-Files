#!/bin/bash

#======================================================
#
# Job script for running a parallel job on a single node  
#
#======================================================

#======================================================
# Propagate environment variables to the compute node
#SBATCH --export=ALL
#
# Run in the standard partition (queue)
#SBATCH --partition=teaching
#
# Specify project account
#SBATCH --account=teaching
#
# Distribute processes in round-robin fashion
#SBATCH --distribution=cyclic
#
# Run the job on one node, all cores on the same node (full node)
#SBATCH --ntasks=2 
#
# Specify (hard) runtime (HH:MM:SS)
#SBATCH --time=24:00:00
#
# Job name
#SBATCH --job-name=CH934-PENCEN.out
#
# Output file
#SBATCH --output=slurm-%j.out
#======================================================

module purge

#module load intel-2020.4
module load gaussian/g16

#======================================================
# Prologue script to record job details
# Do not change the line below
#======================================================
/opt/software/scripts/job_prologue.sh  
#------------------------------------------------------

# Modify the line below to run your program
# Launch the parallel job

export GAUSS_SCRDIR=$SLURM_SUBMIT_DIR
g16 Molecule_PENCEN.com


#======================================================
# Epilogue script to record job endtime and runtime
# Do not change the line below
#======================================================
#/opt/software/scripts/job_epilogue.sh 
#------------------------------------------------------

