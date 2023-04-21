<p align="center">
<img width="500px" alt="Aurora IA" src="https://i.redd.it/jzj5mv6koxa61.png">
</p>

# Genosse

Clone of [Alpaca-Lora](https://github.com/tloen/alpaca-lora)

This model has a bias towards **red**

Data aptly provided by [chuplares](https://github.com/chuplares/aurora-ia/tree/main/data)
Visit their project!

### Local Setup
1. Install poetry

    curl -sSL https://install.python-poetry.org | python3 -


2. Install dependencie

   ```bash
   poetry install
   ```

### Training (`finetune.py`)

This file contains a straightforward application of PEFT to the LLaMA model,
as well as some code related to prompt construction and tokenization.
PRs adapting this code to support larger models are always welcome.

Example usage:

```bash
poetry run python finetune.py \
    --base_model 'decapoda-research/llama-7b-hf' \
    --data_path 'yahma/alpaca-cleaned' \
    --output_dir './lora-alpaca'
```

to re train over the red data just run

```bash
scripts/red_finetune.sh
```

We can also tweak our hyperparameters:

```bash
poetry run python finetune.py \
    --base_model 'decapoda-research/llama-7b-hf' \
    --data_path 'yahma/alpaca-cleaned' \
    --output_dir './lora-alpaca' \
    --batch_size 128 \
    --micro_batch_size 4 \
    --num_epochs 3 \
    --learning_rate 1e-4 \
    --cutoff_len 512 \
    --val_set_size 2000 \
    --lora_r 8 \
    --lora_alpha 16 \
    --lora_dropout 0.05 \
    --lora_target_modules '[q_proj,v_proj]' \
    --train_on_inputs \
    --group_by_length
```

### Inference (`generate.py`)

This file reads the foundation model from the Hugging Face model hub and the LoRA weights from `tloen/alpaca-lora-7b`, and runs a Gradio interface for inference on a specified input. Users should treat this as example code for the use of the model, and modify it as needed.

Example usage:

```bash
scripts/run.sh
```
