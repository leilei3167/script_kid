#!/bin/bash

exec 0<testout #exec命令允许你将STDIN重定向到Linux系统上的文件中

count=1
while read -r line; do # 当read命令试图从STDIN读入数据时，它会到文件去取数据，而不是键盘
    echo "Line #$count: $line"
    count=$((count + 1))
done

# 这是在脚本中从待处理的文件中读取数据的绝妙办法。Linux系统管理员的一项日常任务就
# 是从日志文件中读取数据并处理。这是完成该任务最简单的办法
