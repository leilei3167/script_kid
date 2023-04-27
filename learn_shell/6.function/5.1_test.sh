#!/bin/bash

function doubleArray {
    local origarray
    origarray=("$@")
    newArray=("$@")

    for ((i = 0; i < $#; i++)); do
        newArray[$i]=$((${origarray[$i]} * 2))
    done

    echo ${newArray[*]}
}

inputArray=(1 2 3 4 5 6 7 8 9)

# 展开数组每个元素来调用函数
result=($(doubleArray ${inputArray[*]})) # 命令替换
echo "The new array is: ${result[*]}"
