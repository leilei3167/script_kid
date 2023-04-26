#!/bin/bash

# w命令写入文件
# sed -n '/Browncoat/w Browncoats.txt' data11.txt # 从data11.txt匹配到Browncoat的行写入Browncoats.txt文件
# r读取文件插入数据流
# sed '3r data12.txt' data6.txt # 读取data12.txt文件的内容插入到data6.txt的第3行后面

# r和d搭配可以实现模板替换
# 从notice.std文件中匹配到LIST的行，将data11.txt的内容插入到LIST行后面，然后删除LIST行
sed '/LIST/{
    r data11.txt
    d
}' notice.std
