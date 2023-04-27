#!/bin/bash
trap "echo Goodbye..." EXIT
#
count=1
while [ $count -le 5 ]; do
    echo "Loop #$count"
    sleep 1
    count=$(($count + 1))
done
# 如果提前退出脚本，同样能够捕获到EXIT
