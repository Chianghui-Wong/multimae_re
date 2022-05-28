#! /bin/zsh

gpu_node=$1
gpu_node_sum=$[(${#gpu_node[*]} + 1) / 2]
output_dir=$2
finetune_pth=$3

OMP_NUM_THREADS=1 CUDA_VISIBLE_DEVICES=$gpu_node torchrun --nproc_per_node=$gpu_node_sum --master_port 38930 run_finetuning_depth.py  \
    --config cfgs/finetune/depth/depth.yaml \
    --finetune $finetune_pth \
    --output_dir   $output_dir\
    --wandb_run_name depth_fintune