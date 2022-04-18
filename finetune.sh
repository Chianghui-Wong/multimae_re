#! /bin/zsh

echo $(date)

types_name=("random" "blockwise" "centerblock")
output_root="output/fintune/semseg/imagenetS50/"
date="0418/"

for type in ${types_name}
do
    work_root="${output_root}${type}/${date}"
    echo "start at ${type}"
    rm -f ${work_root}*
    mkdir -p ${work_root}
    nohup sh run_finetuning_semseg.sh ${type}> ${work_root}nohup.out 2>&1
done

echo "finished"