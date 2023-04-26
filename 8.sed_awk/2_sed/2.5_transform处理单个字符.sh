#!/bin/bash
# 转换（transform）命令（y）是唯一可以处理单个字符的sed编辑器命令
# [address]y/inchars/outchars/

# 转换命令会对inchars和outchars值进行一对一的映射。inchars中的第一个字符会被转
# 换为outchars中的第一个字符，第二个字符会被转换成outchars中的第二个字符。这个映射过
# 程会一直持续到处理完指定字符。如果inchars和outchars的长度不同，则sed编辑器会产生一
# 条错误消息
sed 'y/123/789/' data8.txt # 1被替换为7，2被替换为8，3被替换为9

# 转换命令是一个全局命令，也就是说，它会文本行中找到的所有指定字符自动进行转换，而
# 不会考虑它们出现的位置。 你无法限定只转换在特定地方出现的字符
