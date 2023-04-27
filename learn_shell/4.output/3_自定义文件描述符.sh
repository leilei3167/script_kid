#!/bin/bash

# 0-9都可作为文件描述符，但是0-2是保留的，分别代表STDIN、STDOUT和STDERR,其他的可以自定义
exec 3>test13out # 创建3,并指向test13out文件
echo "This should display on the monitor"
echo "and this should be stored in the file" >&3 # 重定向输出至3指向的地方
echo "Then this should be back on the monitor"
