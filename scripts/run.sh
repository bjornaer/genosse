#!/bin/bash

poetry run python generate.py --base_model="decapoda-research/llama-7b-hf" --lora_weights="./weights/" --load_8bit
