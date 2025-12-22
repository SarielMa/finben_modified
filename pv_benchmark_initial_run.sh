#!/bin/bash

lm_eval --model vllm \
  --model_args "pretrained=meta-llama/Llama-3.1-8B-Instruct,tensor_parallel_size=1,gpu_memory_utilization=0.90,max_model_len=4096" \
  --tasks PvExtraction_full \
  --num_fewshot 0 \
  --batch_size 1 \
  --output_path results/PV_vllm \
  --log_samples \
  --apply_chat_template \
  --include_path ./tasks/pv_miner


# Run the Hugging Face LLM evaluation command
# lm_eval --model hf \
#         --model_args "pretrained=meta-llama/Llama-3.1-8B-Instruct" \
#         --tasks PvExtraction_full \
#         --num_fewshot 0 \
#         --device cuda:0 \
#         --batch_size auto \
#         --output_path results/PV_initial \
#         --log_samples \
#         --apply_chat_template \
#         --include_path ./tasks/pv_miner

        

# Run the Hugging Face VLLM evaluation command
# lm_eval --model vllm \
#         --model_args "pretrained=TheFinAI/FinLLaMA,tensor_parallel_size=4,gpu_memory_utilization=0.8,max_model_len=1024" \
#         --tasks regAbbreviation \
#         --num_fewshot 0 \
#         --batch_size auto \
#         --output_path results/abbr \
#         --hf_hub_log_args "hub_results_org=TheFinAI,details_repo_name=lm-eval-llama-regulationAbbr-0shot-result,push_results_to_hub=True,push_samples_to_hub=True,public_repo=False" \
#         --log_samples \
#         --include_path ./tasks
#         #--apply_chat_template \

# output message
echo "Evaluation completed successfully!"
