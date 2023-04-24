#! /bin/bash

# 过多的if会导致结构混乱
if [ $USER = "rich" ]; then
    echo "Welcome $USER"
    echo "Please enjoy your visit"
elif [ $USER = "barbara" ]; then
    echo "Welcome $USER"
    echo "Please enjoy your visit"
elif [ $USER = "testing" ]; then
    echo "Special testing account"
elif [ $USER = "jessica" ]; then
    echo "Do not forget to logout when you're done"
else
    echo "Sorry, you are not allowed here"
fi

# 使用case替代多次if-elif

case $USER in
rich | barbara) # 匹配任意一个
    echo "Welcome $USER"
    echo "Please enjoy your visit"
    ;; # 注意每个条件后面都要有两个分号
testing)
    echo "Special testing account"
    ;;
jessica)
    echo "Do not forget to logout when you're done"
    ;;
lei*)
    echo "Hello leilei"
    ;;
*) # 匹配任何值,可以当做default来使用
    echo "Sorry, you are not allowed here"
    ;;
esac # 结束符,是case反过来写
