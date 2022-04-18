#! /bin/zsh
OMP_NUM_THREADS=1 CUDA_VISIBLE_DEVICES=1,2,5 torchrun --nproc_per_node=3 run_finetuning_semseg.py  \
    --config cfgs/finetune/semseg/ade/ft_imagenetS50_50e_mae-b_rgb.yaml \
    --finetune ~/mae_checkpoint/${1}_multi.pth \
    --output_dir  output/fintune/semseg/imagenetS50/${1}/0418/ \
    --wandb_run_name ft_imagetS50_mae_${1}