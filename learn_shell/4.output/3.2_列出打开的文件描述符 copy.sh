#!/bin/bash
# 要想知道进程的当前PID，可以用特殊环境变量$$（shell会将它设为当前PID）。-a选项用来
# 对其他两个选项的结果执行布尔AND运算，这会产生如下输出

exec 3>test18file1
exec 6>test18file2
exec 7<"test"
# 最常用的有-p和-d，前者允许
# 指定进程ID（PID），后者允许指定要显示的文件描述符编号
# /usr/sbin/lsof -a -p $$ -d 0,1,2
lsof -a -p $$ -d0,1,2,3,6,7
