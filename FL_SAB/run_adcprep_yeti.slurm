#!/bin/bash
# man sbatch,scancel,srun,salloc,squeue,sinfo,scontrol are your friends
### Job name
#SBATCH -J padcirc-fl_sab
### Number of nodes
###SBATCH -N 1
### Number of tasks (cores/cpus for MPI)
#SBATCH -n 32
# Use the SGI UV2000
#SBATCH -p UV
# Slurm Account Code
#SBATCH -A woodshole
# Walltime
#SBATCH -t 24:00:00
### Mail to user
#SBATCH --mail-type=ALL
#SBATCH --mail-user=rsignellusgs.gov
# Combine stdout and stderr in one file (The %j is a macro for JobID)
#SBATCH --output=%j-padcirc-fl_sab


# Modules for Intel compiler
module load intel/psxe-2015 tools/netcdf-4.3.2-intel tools/hdf5-1.8.15-intel

echo "this job is running on:"
echo ${SLURM_JOB_NODELIST}

ulimit -c unlimited

# Intel compiled run
mpirun /home/rsignell/Models/adcirc/trunk/work/adcprep -np 32 -partmesh 
mpirun /home/rsignell/Models/adcirc/trunk/work/adcprep -np 32 -prepall 

exit $?


