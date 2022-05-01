#! /bin/zsh

name=('blockwise')

for i in ${name}; do
    CUDA_VISIBLE_DEVICES=0 python3 vit2multimae_converter.py \
        --vit_ckpt_path ~/mae_checkpoint/${i}.pth \
        --multimae_ckpt_path ~/mae_checkpoint/${i}_multi.pth
done