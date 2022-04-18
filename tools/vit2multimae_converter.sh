#! /bin/zsh

name=('baseline')

for i in ${name}; do
    python3 vit2multimae_converter.py \
        --vit_ckpt_path ~/mae_checkpoint/${i}.pth \
        --multimae_ckpt_path ~/mae_checkpoint/${i}_multi.pth
done