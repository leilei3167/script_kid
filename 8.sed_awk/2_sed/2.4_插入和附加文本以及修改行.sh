#!/bin/bash

# sed '[address]i或者a\ 新内容'

# i代表insert 会在指定行前增加一个新行
# a代表append 会在指定行后增加一个新行
# c代表change 会替换指定行的内容

# 它们不能在单个命令行上使用。你必须指定是要将行插入还是附加到另一行

echo "Test Line 2" | sed 'i\Test Line 1'
echo
echo "Test Line 2" | sed 'a\Test Line 3'

# 要向数据流行内部插入或附加数据，你必须用寻址来告诉sed编辑器你想让数据出现在什么
# 位置。可以在用这些命令时只指定一个行地址。可以匹配一个数字行号或文本模式，但不能用地
# 址区间。这合乎逻辑，因为你只能将文本插入或附加到单个行的前面或后面，而不是行区间的前
# 面或后面

# $ sed '3a\
# > This is an appended line.' data6.txt # 添加到第三行后面

#  sed '$a\
# > This is a new line of text.' data6.txt # 添加到末尾

# 如果要插入多行内容,就使用多条反斜线结尾换行
# sed '1i\
# > This is one line of new text.\
# > This is another line of new text.' data6.txt

# 修改行
# $ sed '/number 3/c\
# > This is a changed line of text.' data6.txt # 修改匹配到number 3的行
