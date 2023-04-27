#! /bin/bash

# break
echo "basic break"
for var1 in 1 2 3 4 5 6 7 8 9 10; do
    if [ $var1 -eq 5 ]; then
        break
    fi
    echo "Iteration number: $var1"
done
echo "The for loop is completed"

echo ""
echo "break with while"
var1=1
while [ $var1 -lt 10 ]; do
    if [ $var1 -eq 5 ]; then
        break
    fi
    echo "Iteration: $var1"
    var1=$(($var1 + 1))
done
echo "The while loop is completed "

echo ""
echo "break with nested for"
for ((a = 1; a < 4; a++)); do
    echo "Outer loop: $a"
    for ((b = 1; b < 100; b++)); do
        if [ $b -eq 5 ]; then
            break 2 # 只会停止最内层的循环,如果需要停止外层循环,使用break 2(默认实际是1)
        fi
        echo " Inner loop: $b"
    done
done
# continue

echo ""
echo "continue with for"
for ((var1 = 1; var1 < 15; var1++)); do
    if [ $var1 -gt 5 ] && [ $var1 -lt 10 ]; then # 跳过5-10之间的数字
        continue
    fi
    echo "Iteration number: $var1"
done

echo ""
echo "continue with nested"
for ((a = 1; a <= 5; a++)); do
    echo "Iteration $a:"
    for ((b = 1; b < 3; b++)); do
        if [ $a -gt 2 ] && [ $a -lt 4 ]; then
            continue 2 # 同样使用2来跳过外层循环
        fi
        var3=$((a * b))
        echo " The result of $a * $b is $var3"
    done
done

# 将循环的结果重定向到文件中,只需在done之后添加命令即可
for file in /home/lei/*; do
    if [ -d "$file" ]; then
        echo "$file is a directory"
    elif [ -f "$file" ]; then
        echo "$file is a file"
    fi
done | sort >file.txt
