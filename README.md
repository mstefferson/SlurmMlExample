# Description

Here is an example MATLAB program and a bash script to run jobs on SLURM (in particular, summit at CU). The MATLAB code doesn't do anything special: just reads in a input, access files in src, and write to a output. It's purpose to give a sense of for I like to structure my working directory for projects and some good common practices.

# Running the code
## Locally
Launch MATLAB. This next step is optional. If initParams.m is not the WD, run
```matlab
cpParams()
```
and edit the params if you'd like. Note, if you run the main code, initParams.m will be copied automatically. To run main code, 
```matlab
main()
```

## On summit
To start, ssh to summit to and clone the repository on there. When you first login, you are on a 'login' node. To submit jobs, you use Slurm. You may want to move this repo to /projects/username (to find username, type `whoami` in the terminal) at some point (see below), but it isn't necessary for our purposes.

Slurm is a job submission software. All jobs (except for simple bash commands), should to submitted through slurm. You a bash script, \*sh (here, summitSlurm.sh), that contains information about your job submission, modules to load, as well as the actual command. Some of the info it tells slurm is what partition (computer type) you want to use, a wall time, etc.

When you first login, you are in a login node. Slurm sends jobs to the compute job. The compile node is a little more easier to use because it already had some modules loaded (like slurm!).  I typically ssh to scompile, and work from here
```bash
ssh scompile
```
But I've set things up so this isn't necessary. Probably a good habit though.

Also, the job script currently is sent up to send me an email when it's done. Edit the line
#SBATCH --mail-user=michael.stefferson@colorado.edu
in summitSlurm.sh to your email.

Note, if you're on summit, you will probably want to clone this repo into you projects folder: `cd /projects/username/` (it shows up as a folder, but really it's a different computer). The read-write is faster here. When the job is done, move the results
to /scratch/summit/username. This is for storage.storage.

### Making an sbatch call to submit

You use the sbatch command to tell slurm you want to submit a job. 
#### If you're on scompile
If you're on scompile, you can just run:

```bash
sbatch --job-name=myjob summitSlurm.sh
```
Feel free to edit the job name (here, we called it myjob) to something else.

Check the status of your job
```bash
squeue -u my_user_name
```
For me, my username is mist7261. Type whoami in bash to see yours.

#### If you're on login
If you're on the login node, you need to load the slurm module first
```bash
module load slurm/summit
sbatch --job-name=myjob summitSlurm.sh
```
### Use the executeable
I like to use an excuteable to submit my jobs. The executeable will do a few things, then submit the job. I like to do this when things get more complicated.
```bash
./jobSubmit myjob
```
This will submit the job for you! Check the status using squeue. This will work on login in node without you having to load slurm (it does it for you)

