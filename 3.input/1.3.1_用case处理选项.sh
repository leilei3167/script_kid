#!/bin/bash

# 分离参数和选项
# Linux中处理这个问题的标准方式是用特殊字符来将二者分开，该字符会告诉脚本何时选项结束以及普通参数何时开始
# 这个特殊字符是双破折线（--）。shell会用双破折线来表明选项列表结束。在
# 双破折线之后，脚本就可以放心地将剩下的命令行参数当作参数，而不是选项来处理了
echo
while [ -n "$1" ]; do
    case "$1" in
    -a) echo "Found the -a option" ;;
    -b) echo "Found the -b option" ;;
    -c) echo "Found the -c option" ;;
    --)       # 遇到--代表选项结束,后续的都是参数
        shift # 移除--参数
        break
        ;;
    *) echo "$1 is not an option" ;;
    esac
    shift
done
# 因为用了shift之前的选项都已被移除了,只剩参数
count=1
for param in "$@"; do
    echo "Parameter #$count: $param"
    count=$((count + 1))
done
