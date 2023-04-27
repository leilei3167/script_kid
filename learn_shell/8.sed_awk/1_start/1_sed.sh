#!/bin/bash

# sed命令的格式如下。
# sed options script file

# s命令会用斜线间指定的第二个文本字符串来替换第
# 一个文本字符串模式。在本例中是big test替换了test
echo "This is a test" | sed 's/test/big test/'

# 处理文件
echo
echo
sed 's/dog/cat/' data1.txt # 将文件中的dog替换为cat

# 重要的是，要记住，sed编辑器并不会修改文本文件的数据。它只会将修改后的数据发送到STDOUT

# 要在sed命令行上执行多个命令时，只要用-e选项就可以了,命令之间必须用分号隔开
# 并且在命令末尾和分号之间不能有空格
echo
echo
sed -e 's/brown/green/; s/dog/cat/' data1.txt

# 从文件中读取sed命令 如果有大量要处理的sed命令，那么将它们放进一个单独的文件中通常会更方便一些
# 文件中每一行都是单独的sed命令,不需要分号
echo
echo
sed -f script1.sed data1.txt
