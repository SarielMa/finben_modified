#!/bin/bash
  

#SBATCH --job-name=fin-pipeline
#SBATCH --mail-type=ALL
#SBATCH --time=00-12:00:00
#SBATCH --nodes=1
#SBATCH --gpus=h200:1
#SBATCH --mem=256G
#SBATCH --partition=gpu_h200
#SBATCH --output=%j_gpu_job.txt


#export CFLAGS="-I$CONDA_PREFIX/include/"
#export LDFLAGS="-L$CONDA_PREFIX/lib/"
#export HF_MODELS_CACHE='/vast/palmer/scratch/xu_hua/lq62/saved_models'
#export HF_DATASETS_CACHE='/vast/palmer/scratch/xu_hua/lq62/saved_datasets'
#export HF_HOME='/vast/palmer/scratch/xu_hua/lq62/saved_models'
#export HF_TOKEN='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'
#export TRITON_CACHE_DIR="/vast/palmer/scratch/xu_hua/lq62/saved_models"

# conda init
# source ~/.bashrc
# conda activate
# conda activate finben

module load miniconda
# conda activate yan-jupyter
# cd /gpfs/radev/home/lq62/project/yw937/MS_MACRO
# sh run_stella.sh

## inference
conda activate finben
cd /home/yw937/inference/FinBen
# sh run_eppc_gemma.sh
# sh run_finni.sh
sh run_fintagging-pipeline-rerank.sh
# sh run_fincl-rerank.sh
# sh run_multifin_en.sh
# sh run_av.sh
# sh run_eppc.sh
# sh run_eppc_gemma.sh

## finetune
# conda activate autotrain
# cd /gpfs/radev/home/lq62/finetune/yan_finetune
# sh run.sh
# sh merge.sh

## finetune eppc
# conda activate autotrain
# cd /gpfs/radev/home/lq62/finetune/yan_finetune
# sh run_eppc.sh
# sh merge_eppc.sh

#sleep 604800
