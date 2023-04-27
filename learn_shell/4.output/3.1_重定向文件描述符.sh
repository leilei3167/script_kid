#!/bin/bash

# 怎么恢复已重定向的文件描述符。你可以分配另外一个文件描述符给标准文件描述符，反之亦然

exec 3>&1        # 3现在指向1(屏幕) 用3来保存1的值
exec 1>test14out # 1现在指向test14out而不是屏幕
echo "This should store in the output file"
echo "along with this line."

exec 1>&3 # 1现在指向3(屏幕) 将1恢复到STDOUT(屏幕),其余信息继续输出到屏幕
echo "Now things should be back to normal"

exec 6<&0        # 用6来保存标准输入
exec 0<test14out # 将标准输入重定向到文件,从文件读取输入
count=1
while read -r line; do
    echo "Line #$count: $line"
    count=$((count + 1))
done
exec 0<&6 # 将标准输入恢复到原来的状态,继续从键盘读取输入
read -r -p "Are you done now? " answer
case $answer in
Y | y) echo "Goodbye" ;;
N | n) echo "Sorry, this is the end." ;;
esac

# 关闭文件描述符,将其重定向到 &-即可 一旦关闭了文件描述符，就不能在脚本中向它写入任何数据，否则shell会生成错误消息
exec 3>&- # 关闭文件描述符3
