#!/bin/bash
# Lines starting with #SBATCH are treated by bash as comments, but interpreted by sbatch
# as arguments.  For more details about usage of these arguments see "man sbatch"

# Set a walltime for the job. The time format is HH:MM:SS

# Run for 24 hours:
#SBATCH --time=23:59:59

# Select one nodes and processors (most likely 1 node)

#SBATCH --nodes 1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task 12

# Set the output file name to [jobid].out (or leave as default of slurm-[jobid].out)

#SBATCH -o job-[jobid].out
#SBATCH -e job-[jobid].err

# Allocation to ucb-general (default)

#SBATCH -A ucb-general

# Select the normal QOS (comperable to a queue)
# If your jobs are longer, this may need to be changed
# to long or condo
#SBATCH --qos=normal

# Set partition to shas (CPU node, 24 hour cap)
#SBATCH --partition=shas

# email (change this)
#SBATCH --mail-type=END
#SBATCH --mail-user=michael.stefferson@colorado.edu

# Load any modules you need here
module load matlab/R2016b

# Execute the program.
echo "Start time: `date`"
echo "Submit dir: ${SLURM_SUBMIT_DIR}"
echo "Job name: ${SLURM_JOB_NAME}" 
echo "Running ${SLURM_NNODES} nodes. ${SLURM_NTASKS_PER_NODE} tasks per node. ${SLURM_CPUS_PER_TASK} processors per task"
echo "In dir `pwd`"
touch jobRunning.txt
# Run matlab program
matlab -nodesktop -nosplash \
  -r  "try, main, catch, exit(1), end, exit(0);"
echo "Finished. Matlab exit code: $?" 
mv jobRunning.txt jobFinished.txt
echo "End time: `date`"
