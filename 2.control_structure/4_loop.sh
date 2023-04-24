#! /bin/bash

# 格式
# for 临时变量 in 列表; do
#     shell命令
# done

# 每次循环都会将列表中的值赋值给var,然后执行shell命令
for var in a b "c d" e f g; do
    echo "The var is $var"
done
# 在最后一次迭代后，$var变量的值不会清空,而是会在shell脚本的剩余
# 部分一直保持有效。它会一直保持最后一次迭代的值
echo "End var is $var"

list="Alabama Alaska Arizona Arkansas Colorado"
list=$list" Connecticut"
for state in $list; do
    echo "Have you ever visited $state?" >>for.txt
done

# 更改字段分割符为换行,这样每一行才会是一个整体
IFS_OLD=$IFS # 保存旧的分隔符,便于后续恢复
IFS=$'\n'
# IFS=$'\n':; # 多个分隔符
# 从文件中读取
for var in $(cat for.txt); do
    echo "The var is $var" # 默认使用空格,制表符,换行符作为分隔符
done

IFS=$IFS_OLD # 恢复旧的分隔符 这就保证了在脚本的后续操作中使用的是IFS的默认值

# 使用for遍历目录,使用双引号括起来,避免空格的影响
echo ""
echo "for循环遍历目录,目录使用通配符*来读取"
# 需要在文件名或路径名中使用通配符。它会强制shell使用文件扩展匹配文件,扩展匹配是生成匹配指定通配符的文件名或路径名的过程
for file in /home/lei/* /home/lei/go/bin/*; do
    if [ -d "$file" ]; then
        echo "$file is a directory"
    elif [ -f "$file" ]; then
        echo "$file is a file"
    fi
done

echo
echo "C语言风格的循环,双括号内不需要使用美元符"
#
# for (( variable assignment ; condition ; iteration process ))
for ((i = 0; i < 10; i++)); do
    echo "The i is $i"
done

echo "循环结束之后的i:$i"

echo
echo "while"
# while [ test command ]
# do
#  other commands
# done
var1=10
while [ $var1 -gt 0 ]; do # 只要var1大于0,就会一直循环,当测试条件为true时,循环继续
    echo $var1
    var1=$((var1 - 1))
done
echo "while循环结束之后的var1:$var1"

echo ""
echo "until"
var1=100
until [ $var1 -eq 0 ]; do # 当测试条件为true时,循环结束
    echo $var1
    var1=$((var1 - 25))
done
echo "until循环结束之后的var1:$var1"

echo ""
echo "嵌套循环打印乘法表"
for ((a = 1; a < 10; a++)); do
    for ((b = 1; b < 10; b++)); do
        c=$((a * b))
        echo -n "$a * $b = $c "
    done
    echo ""
done

# 循环处理文件数据
echo ""
echo "循环处理文件数据"
IFS_OLD=$IFS
IFS=$'\n'
for entry in $(cat /etc/passwd); do
    echo "Values in $entry –"
    IFS=: # 嵌套循环中改变IFS为:
    for value in $entry; do
        echo " $value"
    done
done
IFS=$IFS_OLD
