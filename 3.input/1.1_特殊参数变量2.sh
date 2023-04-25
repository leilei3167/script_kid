#!/bin/bash

# 特殊变量$*和$@变量可以用来轻松访问所有的参数
# $*变量会将命令行上提供的所有参数当作一个单词保存。这个单词包含了命令行中出现的每
# 一个参数值。基本上$*变量会将这些参数视为一个整体，而不是多个个体

# $@变量会将命令行上提供的所有参数当作同一字符串中的多个独立的单词。这样
# 你就能够遍历所有的参数值，得到每个参数。这通常通过for命令完成

# testing $* and $@
#
echo
count=1
#
for param in "$*"; do
    echo "\$* Parameter #$count = $param"
    count=$((count + 1))
done
#
echo
count=1
#
for param in "$@"; do
    echo "\$@ Parameter #$count = $param"
    count=$((count + 1))
done
