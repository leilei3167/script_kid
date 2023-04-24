#! /bin/bash
# if只能测试命令的退出状态码
# 如果要测试其他条件,必须用test命令
# 如果test命令列出的条件成立,则test会返回0
# 和test命令配合,就能实现其他语言中if的功能
# test condition

# test后没有condition,则test命令会返回1(执行else)
var=""
if test "$var"; then
    echo "condition is true"
else
    echo "condition is false"
fi

# 在使用方括号时,test可以省略,但是方括号必须有空格

if [ "$var" ]; then
    echo "condition is true"
else
    echo "condition is false"
fi

# 数值比较,注意不是用大于小于符号,而是用两个连字符,相反,字符串比较用的是用的是大于小于符号
# -eq 等于
# -ne 不等于
# -gt 大于
# -ge 大于等于
# -lt 小于
# -le 小于等于
value1=10
value2=11
#
if [ $value1 -gt 5 ]; then
    echo "The test value $value1 is greater than 5"
fi
#
if [ $value1 -eq $value2 ]; then
    echo "The values are equal"
else
    echo "The values are different"
fi

# bash是无法处理浮点数的,但是可以使用bc命令
# float=2.34
# float1=3.14
# echo "浮点数比较:"
# if [ $float -gt $float1 ]; then # integer expression expected
#     echo "The test value $float is greater than 2.34"
# else
#     echo "The test value $float1 is not greater than 2.34"
# fi

# 正确方式使用bc命令
float=2.34
float1=3.14
echo "使用bc来进行浮点数比较:"
if [ "$(echo "$float > $float1" | bc)" -eq 1 ]; then
    echo "The test value $float is greater than $float1"
else
    echo "The test value $float is not greater than $float1"
fi

# 字符串比较
# = 等于
a="abc"
b="ABC"
if [ $a = $b ]; then
    echo "a=b"
else
    echo "a!=b"
fi

# != 不等于
if [ $a != $b ]; then
    echo "a!=b"
else
    echo "a=b"
fi
# 注意大小写标点会被考虑在内

# < 小于 注意会被shell解释为重定向符号,需要反斜线转义即 \<
# > 大于 注意会被shell解释为重定向符号 \>
val1=baseball
val2=hockey
# 比较测试是标准的ASCII顺序，根据每个字符的ASCII数值来决定排序结果
# sort命令采用的并非是这样的

if [ $val1 \> $val2 ]; then
    echo "$val1 is greater than $val2"
else
    echo "$val1 is less than $val2"
fi

# -n和-z用于检查变量是否有数据,-n 断言字符串长度不是0,-z断言字符串长度是0
val1=testing
val2=''
if [ -n "$val1" ]; then # 长度非0,返回0,执行then
    echo "The string '$val1' is not empty"
else
    echo "The string '$val1' is empty"
fi

if [ -z "$val2" ]; then # 长度为0,返回0,执行then
    echo "The string '$val2' is empty"
else
    echo "The string '$val2' is not empty"
fi

# 文件比较,使用非常广泛
# -d file 检查file是否存在并是一个目录,准备切换到目录时,先检查目录是否存在
jump=/home/lei1
if [ -d $jump ]; then
    echo "The $jump directory exists"
    cd $jump || return 1
    ls -alh
else
    echo "The $jump directory does not exist"
fi

# -e file 检查文件或目录是否存在,无法确定他是否是一个文件
location=$HOME
file_name="sentinel"
#
if [ -e "$location" ]; then #Directory does exist
    echo "OK on the $location directory."
    echo "Now checking on the file, $file_name."
    #
    if [ -e "$location/$file_name" ]; then #可检查文件是否存在,存在写入,不存在不写入
        echo "OK on the filename"
        echo "Updating Current Date..."
        date >>"$location/$file_name"
    #
    else #File does not exist
        echo "File does not exist"
        echo "Nothing to update"
    fi
#
else #Directory does not exist
    echo "The $location directory does not exist."
    echo "Nothing to update"
fi
# -f file 检查file是否存在并是一个文件,用于检查文件是否存在,并且不是目录
# -r file 检查file是否存在并可读,用于从文件读取数据前检查
# -s file 检查file是否存在并非空,检查是否是空文件,尤其是不想删除非空文件的时候有用
# -w file 检查file是否存在并可写
# -x file 检查file是否存在并可执行,脚本中运行脚本时有用
# -O file 检查file是否存在并属当前用户所有
# -G file 检查file是否存在并且默认组与当前用户相同
# file1 -nt file2 检查file1是否比file2新 (newer than)
# file1 -ot file2 检查file1是否比file2旧 (older than)

# if中使用双括号数学运算,数学运算时大于小于号不需要转义,且变量的美元符可以省去
a=1
b=2
if ((a < b / 2)); then
    ((a = a * 2))
else
    ((b = b * 2))
fi
echo $a $b

# if中使用双方括号进行高级字符串比较,支持模式匹配,正则
user=lei
if [[ $user == l* ]]; then
    echo "user is l*"
else
    echo "user is not l*"
fi
