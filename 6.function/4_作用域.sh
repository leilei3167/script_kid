#!/bin/bash

# 全局变量是在shell脚本中任何地方都有效的变量。如果你在脚本的主体部分定义了一个全局
# 变量，那么可以在函数内读取它的值。类似地，如果你在函数内定义了一个全局变量，可以在脚
# 本的主体部分读取它的值
# 默认情况下，你在脚本中定义的任何变量都是全局变量。在函数外定义的变量可在函数内正
# 常访问

function db1 {
    value=$((value + 5)) # 直接使用全局变量,但这其实很危险，尤其是如果你想在不同的shell脚本中使用函数的话
}

read -r -p "Enter a value: " value
db1
echo "The new value is: $value"

echo
echo "局部变量"
# 局部变量 函数内部使用的任何变量都可以被声明成局部变量。要实现这一点，只要在变量声明的前面加上local关键字就可以了
# local关键字保证了变量只局限在该函数中。如果脚本中在该函数之外有同样名字的变量，
# 那么shell将会保持这两个变量的值是分离的
function func1 {
    local temp=$((value + 5)) # 局部变量temp只在函数内部有效
    result=$((temp * 2))      # 函数内部声明的变量如果没有local关键字,则默认为全局变量
}
temp=4 # 外部同名变量,不会被函数内的同名变量覆盖
value=6
func1
echo "The result is $result"
if [ $temp -gt $value ]; then
    echo "temp is larger"
else
    echo "temp is smaller"
fi
