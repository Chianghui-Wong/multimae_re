#! /bin/zsh
OMP_NUM_THREADS=1 CUDA_VISIBLE_DEVICES=0 torchrun --nproc_per_node=1 run_finetuning_semseg.py  \
    --config cfgs/finetune/semseg/ade/ft_imagenetS50_50e_mae-b_rgb.yaml \
    --finetune ~/mae_checkpoint/blockwise_multi.pth \
    --output_dir  output/fintune/semseg/imagenetS50/blockwise/0417/ \
    --wandb_run_name ft_imagetS50_mae_blockwise 