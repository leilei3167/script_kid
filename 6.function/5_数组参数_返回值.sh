#!/bin/bash
function testit {
    echo "The parameters are: $@"
    thisarray=$1
    echo "The received array is ${thisarray[*]}"
}

myarray=(1 2 3 4 5)
echo "The original array is: ${myarray[*]}"
testit "$myarray" # 不能直接传数组

# 函数只会取数组变量的第一个值。
# 要解决这个问题，你必须将该数组变量的值分解成单个的值，然后将这些值作为函数参数使
# 用

echo
echo "正确用法"
function testit1 {
    local newarray
    newarray=("$@") # 将所有参数放入到一个数组中
    echo "The new array value is: ${newarray[*]}"
}
myarray=(1 2 3 4 5)
echo "The original array is ${myarray[*]}"
testit1 "${myarray[*]}" # 需要将数组全部展开,在函数内部重新组装

echo
echo "求数组和"
function addarray {
    local sum=0
    local newarray
    newarray=("$@")
    for value in ${newarray[*]}; do
        sum=$((sum + value))
    done
    echo $sum
}
myarray=(1 2 3 4 5 1000)
echo "The original array is: ${myarray[*]}"
result=$(addarray "${myarray[@]}") # 传递数组的每个元素
echo "The result is $result"

echo
echo "从函数返回数组"
# 从函数返回数组
function arraydblr {
    local origarray
    local newarray
    local elements
    local i
    origarray=($(echo "$@"))
    newarray=($(echo "$@"))
    elements=$(($# - 1))
    for ((i = 0; i <= $elements; i++));



    do
        newarray[$i]=$((${origarray[$i]} * 2))
    done
    echo ${newarray[*]}
}
myarray=(1 2 3 4 5)
echo "The original array is: ${myarray[*]}"
arg1=$(echo ${myarray[*]})
result=($(arraydblr $arg1))
echo "The new array is: ${result[*]}"
