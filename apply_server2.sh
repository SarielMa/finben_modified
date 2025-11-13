#!/bin/bash
  

#SBATCH --job-name=2shot
#SBATCH --mail-type=ALL
#SBATCH --time=00-15:00:00
#SBATCH --nodes=1
#SBATCH --gpus=h200:2
#SBATCH --mem=256G
#SBATCH --partition=gpu_h200
#SBATCH --output=%j_gpu_job.txt
#SBATCH --mail-user=linhai.ma@yale.edu

module load miniconda
conda activate finben_vllm3
cd /home/lm2445/project_pi_sjf37/lm2445/finben/FinBen
sh run_eppc_2shot.sh