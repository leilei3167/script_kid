#!/bin/bash

mypath=$(echo $PATH | sed 's/:/ /g') # g代表全局替换,这里将:全部替换为空格
count=0
# 遍历目录
for dir in $mypath; do
    # 单个目录
    if check=$(ls $dir 2>/dev/null); then
        for item in $check; do
            count=$((count + 1))
        done
    fi
    echo "$dir - $count"
    count=0
done
