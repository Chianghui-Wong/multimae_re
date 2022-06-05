#! /bin/zsh

gpu_node=${1:-"1,2,3,4,5"}
type=${2:-"depth"}
finetune_pth=${3:-"/home/jhwang/mae_checkpoint/baseline.pth"}

echo $gpu_node $type $finetune_pth

timestamp=`date "+%m-%d-%H%M%S"`
output_dir="output/finetune/${type}/${timestamp}/"

# mae-b_dec512d8b_1600e_multivit-c477195b.pth
# multimae-b_98_rgb+-depth-semseg_1600e_multivit-afff3f8c.pth
# baseline.pth 
# rgb_depth.pth
# multi_softmax.pth
# multi_uncertainty.pth

mkdir -p ${output_dir}

nohup zsh run_finetuning_${type}.sh ${gpu_node} ${output_dir} ${finetune_pth} > ${output_dir}nohup 2>&1 &

echo "start finetune.sh finshed"