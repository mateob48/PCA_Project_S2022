#!/bin/bash
#
##SBATCH --nodes=1
#SBATCH --job-name=firstTest1GPU
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --time=00:30:00
#SBATCH --mem=3GB
#SBATCH --gres=gpu:1
#SBATCH --mail-type=END
##SBATCH --mail-user=mjb9333@nyu.edu
#SBATCH --output=test1_1.out 
module purge
module load matlab/2016b
cd /scratch/$USER/mytest1
cat mvnpdfCU.m | srun matlab -nodisplay