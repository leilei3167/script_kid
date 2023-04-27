#!/bin/bash
# 默认情况下，在sed编辑器中使用的命令会作用于文本数据的所有行。如果只想将命令作用
# 于特定行或某些行，则必须用行寻址（line addressing）

# 1.数字形式表示行区间

#  sed '2s/dog/cat/' data1.txt # 只会替换第二行的dog
# sed '2,3s/dog/cat/' data1.txt # 会替换第二行和第三行的dog
# sed '2,$s/dog/cat/' data1.txt  # 会替换第二行到最后一行的dog, $表示最后一行

# 2.文本模式过滤(常和正则表达式一起使用)  /pattern/command 必须用正斜线将要指定的pattern封起来
#  sed '/lei/s/bash/csh/' /etc/passwd # 只会替换包含lei的行中的bash
# 可结合正则表达式实现强大的过滤效果
# sed '/^#/d' /etc/passwd # 删除所有以#开头的行

# 3.命令组合 如果需要在单行上执行多条命令，可以用花括号将多条命令组合在一起,sed编辑器会处理地址行处列出的每条命令
# address {
#  command1
#  command2
#  command3
# }
