#!/bin/bash

# 特殊变量$#含有脚本运行时携带的命令行参数的个数
# getting the number of parameters
#
echo There were $# parameters supplied.
# 获取最后一个变量不能这样:
#echo The last parameter was ${$#}
echo The last parameter was ${!#}

# 可以方便的检测所需的参数数量是否满足需求
if [ $# -ne 2 ]; then
    echo
    echo you need to supply two parameters.
else
    total=$(($1 + $2))
    echo The total is $total
fi
