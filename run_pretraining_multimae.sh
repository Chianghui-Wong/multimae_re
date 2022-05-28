#! /bin/zsh
gpu_node=$1
gpu_node_sum=$[(${#gpu_node[*]} + 1) / 2]
output_dir=$2

echo $gpu_node_sum

OMP_NUM_THREADS=1 CUDA_VISIBLE_DEVICES=${gpu_node} torchrun --nproc_per_node=${gpu_node_sum} --master_port 38950 run_pretraining_multimae.py  \
    --config cfgs/pretrain/multimae-imagenetS50.yaml \
    --output_dir $output_dir \
    --task_balance softmax \
    --no_extra_norm_pix_loss \
    --log_wandb \
    --wandb_project multimae-imagenetS-pretrain \
    --wandb_run_name imagenetS50-rgb+semseg+depth-softmax 
