#!/bin/bash
# mktemp会在本地目录中创建一个文件。要用mktemp命令在本地目录中创建一
# 个临时文件，你只要指定一个文件名模板就行了。模板可以包含任意文本文件名，在文件名末尾
# 加上6个X就行了
# mktemp命令会用6个字符码替换这6个X，从而保证文件名在目录中是唯一的。你可以创建多
# 个临时文件，它可以保证每个文件都是唯一的。
# mktemp testing.XXXXXX
# mktemp命令的输出正是它所创建的文件的名字。在脚本中使用mktemp命令
# 时，可能要将文件名保存到变量中，这样就能在后面的脚本中引用了

tempfile=$(mktemp test19.XXXXXX)
exec 3>$tempfile # 创建3号文件描述符,并重定向输出至临时文件
echo "This script writes to temp file $tempfile"
echo "This is the first line" >&3 # echo的输出重定向至3指向的地方
echo "This is the second line." >&3
echo "This is the last line." >&3
exec 3>&- # 关闭3文件描述符
echo "Done creating temp file. The contents are:"
cat $tempfile
