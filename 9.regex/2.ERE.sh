#!/bin/bash
# POSIX ERE模式包括了一些可供Linux应用和工具使用的额外符号。gawk程序能够识别ERE
# 模式，但sed编辑器不能
# 记住，sed编辑器和gawk程序的正则表达式引擎之间是有区别的。gawk程序可以使用大多
# 数扩展正则表达式模式符号，并且能提供一些额外过滤功能，而这些功能都是sed编辑器
# 所不具备的。但正因为如此，gawk程序在处理数据流时通常才比较慢

# 问号 ? ,类似于星号,但是问号前面的字符只允许出现0次或1次,多于的不会匹配
# 它也经常和字符组一起使用
echo "bat" | gawk '/b[ae]?t/{print $0}'
echo "baet" | gawk '/b[ae]?t/{print $0}' # 匹配不上,因为a或e只能出现0次或1次

# 加号 + 加号是类似于星号的另一个模式符号，但跟问号也有不同。加号表明前面的字符可以出现1次或多次，但必须至少出现1次

# ERE中的花括号允许你为可重复的正则表达式指定一个上限 这通常称为间隔（interval）

# {10}:出现10次
# {2,10}至少出现2次,最多10次
# 默认情况下，gawk程序不会识别正则表达式间隔。必须指定gawk程序的--re- interval
echo "bt" | gawk --re-interval '/be{1}t/{print $0}'

# 管道符号
# 管道符号允许你在检查数据流时，用逻辑OR方式指定正则表达式引擎要用的两个或多个模
# 式。如果任何一个模式匹配了数据流文本，文本就通过测试。如果没有模式匹配，则数据流文本
# 匹配失败
# 注意,管道符前后文本不能有空格
echo "The cat is asleep" | gawk '/cat|dog/{print $0}' # cat或者dog匹配
echo "He has a hat." | gawk '/[ch]at|dog/{print $0}'

# 圆括号分组
# 当你将正则表达式模式分组时，该组会被视为一
# 个标准字符。可以像对普通字符一样给该组使用特殊字符
echo "Sat" | gawk '/Sat(urday)?/{print $0}' # urday被视为一个整体,该整体出现1次或者0次
echo "tac" | gawk '/(c|b)a(b|t)/{print $0}' # 分组常和管道符一起使用,第一个字符为a或b,第二字符必须为a第三个字符为b或t