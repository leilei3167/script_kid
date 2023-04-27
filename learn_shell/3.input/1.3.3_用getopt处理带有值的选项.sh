#!/bin/bash

# getopt optstring parameters
# getopt ab:cd -a -b test1 -cd test2 test3
# 输出: -a -b test1 -c -d -- test2 test3
# 它会检查提供的参数列表（-a -b test1 -cd
# test2 test3），并基于提供的optstring进行解析。注意，它会自动将-cd选项分成两个单独的选项
# 并插入--来分隔剩余的额外参数

# 注意getopt自身的命令必须在optstring之前

# 将原始的命令传递给getopt处理,并将其处理结果重新设置到脚本的位置参数中
set -- $(getopt -q ab:cd "$@")
echo
while [ -n "$1" ]; do
    case "$1" in
    -a) echo "Found the -a option" ;;
    -b)
        param="$2"
        echo "Found the -b option, with parameter value $param"
        shift
        ;;
    -c) echo "Found the -c option" ;;
    --)
        shift
        break
        ;;
    *) echo "$1 is not an option" ;;
    esac
    shift
done
#
count=1
for param in "$@"; do
    echo "Parameter #$count: $param"
    count=$((count + 1))
done

# getopt无法处理带空格的参数,需要使用更高级的getopts
