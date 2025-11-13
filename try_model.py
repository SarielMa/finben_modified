from vllm import LLM

model = LLM(
    model="google/gemma-2-27b-it",
    tensor_parallel_size=1,
    quantization="fp8",
)

outputs = model.generate("Hello!", max_new_tokens=20)
print(outputs[0].outputs[0].text)

