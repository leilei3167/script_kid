#!/bin/bash

# 使用read命令从标准输入或文件中获取输入
# read后跟若干个变量名称,输入的值会被分配给这些变量
# -p 选项用于指定提示文字,-t用于指定超时,超时后read命令将返回非零退出状态
if read -t 3 -p "Enter your name: " -r first last; then # -r选项用于防止反斜杠\被解释为转义字符
    echo "Hello $first $last, welcome to my program. "
else
    echo
    echo "Sorry, too slow!"
fi
# 如果不指定变量,将会保存在REPLY环境变量中

echo
echo "也可以不限制时间,而是用-nX来限制输入的字符数,达到了即退出,无需按回车"
echo
read -n1 -p "Do you want to continue [Y/N]? " -r answer
case $answer in
Y | y)
    echo
    echo "fine, continue on…"
    ;;
N | n)
    echo
    echo OK, goodbye
    exit
    ;;
esac
echo "This is the end of the script"

echo
echo "隐藏方式读取加-s,输入的字符不会显示在屏幕上,用于输入密码"
echo
read -s -p "Enter your password: " -r pass
echo
echo "Is your password really $pass? "

# 从文件中读取
# 每次调用read命令，它都会从文件中读取一行文本。当文件中再没有内容时，read命令会退出并返回非零退出状态码
count=1
while read -r line; do
    echo "Line $count: $line"
    count=$((count + 1))
done <test.txt
echo "Finished processing the file"
