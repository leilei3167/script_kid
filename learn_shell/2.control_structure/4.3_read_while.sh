#!/bin/bash

# read命令会自动读取文本文件的下一行,当文件读取完毕时read命令会返回false
# read根据IFS来分隔文本行,默认IFS是空格和tab
# 当你想要读取包含反斜杠字符的文本时，应该使用-r选项输出原始字符而不进行转义
input="users.csv"
while IFS=',' read -r userid name; do
    echo "User ID: $userid Name: $name"
done <"$input" # 此处的 < 是重定向符号,输入重定向为文件
