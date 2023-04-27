#!/bin/bash
# gawk能提供一个类编程环境来修改和重新组织文件中的数据
# 一般系统中的awk命令是gawk的软连接
# readlink -f $(which awk)  # /usr/bin/gawk
# 其中最完美的例子是格式化日志文件。在日志文件中找出错误行会很难，gawk程序可以让
# 你从日志文件中过滤出需要的数据元素，然后你可以将其格式化，使得重要的数据更易于阅读

# gawk程序的基本格式如下：
# gawk options program file

# -F fs 指定行中划分数据字段的字段分隔符
# -f file 从指定的文件中读取程序
# -v var=value 定义gawk程序中的一个变量及其默认值
# -mf N 指定要处理的数据文件中的最大字段数
# -mr N 指定数据文件中的最大数据行数
# -W keyword 指定gawk的兼容模式或警告等级

# gawk程序脚本用一对花括号来定义。你必须将脚本命令放到两个花括号 由于gawk命令行假定脚本是单个文本字符串，你还必须将脚本放到单引号中

# gawk '{print "Hello World!"}' # 由于没有指定输入,他会等待从标准输入的数据,每输入一次数据就会执行一次脚本
# ctrl+D 结束输入(产生EOF)

# gawk的主要特性之一是其处理文本文件中数据的能力。它会自动给一行中的每个数据元素分配一个变量。默认情况下，gawk会将如下变量分配给它在文本行中发现的数据字段
# $0代表整个文本行；
# $1代表文本行中的第1个数据字段；
# $2代表文本行中的第2个数据字段；
# $n代表文本行中的第n个数据字段
# 个数据字段都是通过字段分隔符划分的。gawk在读取一行文本时，会用预定
# 义的字段分隔符划分每个数据字段。gawk中默认的字段分隔符是任意的空白字符（例如空格或制
# 表符）。

# gawk -F: '{print $1}' /etc/passwd # 采用了其他字段分隔符的文件，可以用-F选项指定字段分隔符,此处用:分隔

# 多命令组合依然用分号隔开
echo "My name is Rich" | gawk '{$4="Christine"; print $0}' # 将第4个字段替换为Christine并打印整个文本行

echo
echo "从文件读取命令"
gawk -F: -f script2.gawk /etc/passwd

echo
echo "处理数据前运行,如生产标题开头等之后在处理数据 使用BEGIN"
# BEGIN只会处理数据前执行,执行完毕后立刻退出,想使用正常的程序脚本中处理数据，必须用另一个脚本区域来定义程序
gawk 'BEGIN {print "The content: "}; {print $0}; END {print "Everything is OK"}' /etc/passwd

# 相反的可以使用END来创建一个数据处理完之后的脚本

echo
echo
gawk -f script4.gawk /etc/passwd
