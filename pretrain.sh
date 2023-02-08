#! /bin/zsh

gpu_node="0,1,2,3,4,5"

timestamp=`date "+%m-%d-%H%M%S"`
output_dir="output/pretrain/${timestamp}/"

mkdir -p ${output_dir}

nohup zsh run_pretraining_multimae.sh ${gpu_node} ${output_dir} > ${output_dir}nohup 2>&1 &

echo "start sh finshed"

