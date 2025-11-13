#!/bin/bash

export HF_TOKEN='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'
set -e

## here it means the running rounds not the shots
SHOTS=(
        0
        1
        2
        3
        4
      )

## replace with your models
MODELS=(
    #"plandes/sdoh-llama-3-3-70b"
    # "Qwen/QwQ-32B"
    # "deepseek-ai/DeepSeek-R1-Distill-Qwen-32B"
    "YanAdjeNole/sdoh-llama-3.3-70b"
    "google/gemma-2-27b-it"
    )


# # Run the Hugging Face VLLM evaluation command
# for MODEL in "${MODELS[@]}"; do
#     echo "running model: $MODEL"
#     for SHOT in "${SHOTS[@]}"; do
#         lm_eval --model vllm \
#                  --model_args "pretrained=$MODEL,tensor_parallel_size=4,gpu_memory_utilization=0.90,max_model_len=24676" \
#                  --tasks EppcExtraction \
#                  --num_fewshot 2 \
#                  --batch_size auto \
#                  --output_path results/eppc \
#                  --hf_hub_log_args "hub_results_org=YanAdjeNole,details_repo_name=eppc-2shot,push_results_to_hub=True,push_samples_to_hub=True,public_repo=True" \
#                  --log_samples \
#                  --apply_chat_template \
#                  --include_path ./tasks/eppc
#         sleep 1
#     done
#     sleep 3
# done



for MODEL in "${MODELS[@]}"; do
    echo "running model: $MODEL"

    # set max length depending on model
    if [[ "$MODEL" == *"gemma"* || "$MODEL" == *"sdoh-llama-3.3"* ]]; then
        MAX_LEN=8192
    else
        MAX_LEN=24676
    fi

    # Gemma requires disabling FlashAttention
    if [[ "$MODEL" == *"gemma"* ]]; then
        EXTRA_ARGS="enforce_eager=True,disable_custom_kernels=True"
    else
        EXTRA_ARGS=""
    fi

    for SHOT in "${SHOTS[@]}"; do
        echo "  -> few-shot: $SHOT (max_model_len=$MAX_LEN)"

        lm_eval --model vllm \
            --model_args "pretrained=$MODEL,tensor_parallel_size=2,gpu_memory_utilization=0.90,max_model_len=$MAX_LEN,$EXTRA_ARGS" \
            --tasks EppcExtraction \
            --num_fewshot 2 \
            --batch_size auto \
            --output_path results/eppc \
            --hf_hub_log_args "hub_results_org=YanAdjeNole,details_repo_name=eppc-${SHOT}shot,push_results_to_hub=True,push_samples_to_hub=True,public_repo=True" \
            --log_samples \
            --apply_chat_template \
            --include_path ./tasks/eppc

        sleep 1
    done
    sleep 3
done
        
# output message
echo "Evaluation completed successfully!"
