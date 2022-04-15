#! /bin/zsh
OMP_NUM_THREADS=1 CUDA_VISIBLE_DEVICES=4,5 torchrun --nproc_per_node=2 run_finetuning_semseg.py  \
    --config cfgs/finetune/semseg/ade/ft_imagenetS50_50e_mae-b_rgb.yaml \
    --finetune ~/mae_checkpoint/blockwise_multi.pth