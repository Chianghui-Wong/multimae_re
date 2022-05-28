#!/bin/zsh

gpu_node=$1
gpu_node_sum=$[(${#gpu_node[*]} + 1) / 2]
output_dir=$2
finetune_pth=$3

OMP_NUM_THREADS=1 CUDA_VISIBLE_DEVICES=$gpu_node torchrun --nproc_per_node=$gpu_node_sum --master_port 38910 run_finetuning_cls.py  \
    --config cfgs/finetune/cls/ft_imageS50_100e_multimae.yaml \
    --finetune $finetune_pth \
    --output_dir  $output_dir \
    --wandb_run_name rgb_depth_cls