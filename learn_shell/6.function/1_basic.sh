#!/bin/bash

# 脚本中定义的每个函数都必须有一个唯一的名称 函数名必须是唯一的，否则也会有问题。如果你重定义了函数，
# 新定义会覆盖原来函数的定义，这一切不会产生任何错误消息

# 两种格式
function hello() {
    echo "hello world"
}

hello1() {
    echo "hello world"
}

function func1 {
    echo "This is an example of a function"
}
count=1
while [ $count -le 5 ]; do
    func1
    count=$(($count + 1))
done
echo "This is the end of the loop"

# 调用函数直接输入函数名称即可
func1
echo "Now this is the end of the script"

# 如果在函数被定义前使用函数，你会收到一条错误消息
func2
