#!/bin/bash

MODELS=(
  "meta-llama/Llama-3.3-70B-Instruct"
  #"Qwen/QwQ-32B-AWQ"
  "meta-llama/Llama-3.1-8B-Instruct"
  "meta-llama/Llama-3.2-3B-Instruct"
  "Qwen/Qwen2.5-1.5B-Instruct"
)

for MODEL in "${MODELS[@]}"; do
  echo "Running lm_eval for model: ${MODEL}"

  lm_eval --model vllm \
    --model_args "pretrained=${MODEL},tensor_parallel_size=2,gpu_memory_utilization=0.90,max_model_len=8096" \
    --tasks PvExtraction_full_all \
    --num_fewshot 0 \
    --batch_size auto \
    --output_path results/PV_1224_all \
    --log_samples \
    --apply_chat_template \
    --include_path ./tasks/pv_miner_all
done