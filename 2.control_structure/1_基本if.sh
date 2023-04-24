#! /bin/bash

# 最基本的是if-then,格式如下:
# if command
# then
#  commands
# fi

# bash shell的if语句会运行if后面的那个命令。如果该命令的退出状态码（参见第11章）是0（该命令成功运行），位于then部分的命令就会被执行。
# 如果该命令的退出状态码是其他值,then部分的命令就会被忽略,shell会继续执行脚本中的下一条命令。

if pwd; then
    echo "It worked"
fi

# IamNotaCommand: command not found
# if IamNotaCommand; then
#     echo "It worked"
# fi

# then部分可以有多条命令
testuser=lei
# 查找lei这个用户名是否存在
if grep $testuser /etc/passwd; then
    echo "This is my first command"
    echo "This is my second command"
    echo "I can even put in other commands besides echo:"
    ls -a /home/$testuser/.b*
fi

# else
testuser=lei111
# 查找lei这个用户名是否存在,if命令返回值为1,则执行else部分的命令
if grep $testuser /etc/passwd; then
    echo "This is my first command"
    echo "This is my second command"
    echo "I can even put in other commands besides echo:"
    ls -a /home/$testuser/.b*
else
    echo "The user $testuser does not exist on this system."
fi

# 嵌套if
if grep $testuser /etc/passwd; then
    echo "The user $testuser exists on this system."
else
    echo "The user $testuser does not exist on this system."
    # 用户不存在,判断其是否有home文件夹,嵌套if不容易阅读,不推荐使用
    if ls -d /home/$testuser/; then
        echo "However, $testuser has a directory."
    fi
fi

# elif
# elif是else if的缩写,用于测试多个条件,多个条件是按顺序执行的
if grep $testuser /etc/passwd; then
    echo "The user $testuser exists on this system."
#
elif ls -d /home/$testuser; then
    echo "The user $testuser does not exist on this system."
    echo "However, $testuser has a directory."
#
fi

testuser=NoSuchUser
#
if grep $testuser /etc/passwd; then
    echo "The user $testuser exists on this system."
#
elif ls -d /home/$testuser; then
    echo "The user $testuser does not exist on this system."
    echo "However, $testuser has a directory."
#
else
    echo "The user $testuser does not exist on this system."
    echo "And, $testuser does not have a directory."
fi
