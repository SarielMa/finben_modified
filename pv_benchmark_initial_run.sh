#!/bin/bash

lm_eval --model vllm \
  --model_args "pretrained=meta-llama/Llama-3.3-70B-Instruct,tensor_parallel_size=2,gpu_memory_utilization=0.90,max_model_len=16384" \
  --tasks PvExtraction_full \
  --num_fewshot 1 \
  --batch_size auto \
  --output_path results/PV_1222 \
  --log_samples \
  --apply_chat_template \
  --include_path ./tasks/pv_miner

lm_eval --model vllm \
  --model_args "pretrained=Qwen/QwQ-32B-AWQ,tensor_parallel_size=2,gpu_memory_utilization=0.90,max_model_len=16384" \
  --tasks PvExtraction_full \
  --num_fewshot 1 \
  --batch_size auto \
  --output_path results/PV_1222 \
  --log_samples \
  --apply_chat_template \
  --include_path ./tasks/pv_miner

lm_eval --model vllm \
  --model_args "pretrained=meta-llama/Llama-3.1-8B-Instruct,tensor_parallel_size=2,gpu_memory_utilization=0.90,max_model_len=16384" \
  --tasks PvExtraction_full \
  --num_fewshot 1 \
  --batch_size auto \
  --output_path results/PV_1222 \
  --log_samples \
  --apply_chat_template \
  --include_path ./tasks/pv_miner

lm_eval --model vllm \
  --model_args "pretrained=meta-llama/Llama-3.2-3B-Instruct,tensor_parallel_size=2,gpu_memory_utilization=0.90,max_model_len=16384" \
  --tasks PvExtraction_full \
  --num_fewshot 1 \
  --batch_size auto \
  --output_path results/PV_1222 \
  --log_samples \
  --apply_chat_template \
  --include_path ./tasks/pv_miner

lm_eval --model vllm \
  --model_args "pretrained=Qwen/Qwen2.5-1.5B-Instruct,tensor_parallel_size=2,gpu_memory_utilization=0.90,max_model_len=16384" \
  --tasks PvExtraction_full \
  --num_fewshot 1 \
  --batch_size auto \
  --output_path results/PV_1222 \
  --log_samples \
  --apply_chat_template \
  --include_path ./tasks/pv_miner




