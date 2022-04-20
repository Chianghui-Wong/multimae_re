#! /bin/zsh

echo $(date)

types_name=("random")
output_root="./output/fintune/semseg/imagenetS50/"
date="0419"

for type in ${types_name}
do
    work_root="${output_root}${type}/${date}/"
    echo "start at ${type}"
    
    if [ ! -d ${work_root} ]
    then
        mkdir -p ${work_root}
    else
        rm -rf ${work_root}
        mkdir -p ${work_root}
    fi
    
    nohup sh run_finetuning_semseg.sh ${type} ${work_root}> ${work_root}nohup.out 2>&1
done

echo "finished"