#!/bin/bash

python generate.py --base_model="decapoda-research/llama-7b-hf" --lora_weights="./genosse/" --load_8bit
