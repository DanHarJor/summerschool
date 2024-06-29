#!/bin/bash
#SBATCH --job-name=job_prog
#SBATCH --account=project_465001194
#SBATCH --partition=small
#SBATCH --time=00:10:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH -o prog.out
#SBATCH -e prog.err

# srun launches "nodes * ntasks-per-nodes" copies of myprog
srun prog
srun --overlap --pty --jobid=$jobid top