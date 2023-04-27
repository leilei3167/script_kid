#!/bin/bash

# ./somesript.sh -a -b -c foo bar
# foo bar就是命令行参数,-a -b -c是改变命令行为的选项

# 位置参数 $0是程序的名称,$1是第一个参数,$2是第二个参数以此类推,直到第9个参数$9
# 第十个以后的参数必须加花括号,${10}

name=$(basename "$0") # basename命令会删除路径名,只保留文件名

# 使用命令行参数时记得要先测试参数,当脚本认为参数变量中会有数据而实际上并没有时，脚本很有可能会产生错误消息
if [ -n "$1" ]; then
    echo "${name}: Args All right!"
else
    echo "you need to supply at least one argument"
    exit 1
fi
