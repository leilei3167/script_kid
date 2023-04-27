#!/bin/bash
# bash shell会把函数当作一个小型脚本，运行结束时会返回一个退出状态码有3种不同的方法来为函数生成退出状态码

# 默认情况下，函数的退出状态码是函数中最后一条命令返回的退出状态码(无法知道之前的命令有没有正常运行)。在函数执行结束后，可以用标准变量$?来确定函数的退出状态码
func1() {
    echo "trying to display a non-existent file"
    ls -l badfile # 出现错误,无法发现
    echo "done"
}
echo "testing the function: "
func1
echo "The exit status is: $?"

# 使用return命令来指定函数的退出状态码
function dbl {
    read -r -p "Enter a value: " value
    echo "doubling the value"
    return $((value * 2))
}
dbl
echo "The new value is $?"
# 当用这种方法从函数中返回值时，要小心了。记住下面两条技巧来避免问题：
# 记住，函数一结束就取返回值；
# 记住，退出状态码必须是0~255。

echo
echo

# 获取函数的输出
function db2 {
    read -r -p "Enter a value: " value
    echo $((value * 2))
    # echo "djsajdsa" 也会作为输出传递
}
result=$(db2)
echo "The new value is $result"
