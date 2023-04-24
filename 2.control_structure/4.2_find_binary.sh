#! /bin/bash

# 扫描PATH获取可执行文件
IFS=:
c=1
for folder in $PATH; do
    for file in "$folder"/*; do
        if [ -x "$file" ]; then
            echo "    $file"
        fi
    done

    # 避免打印过多
    ((c++))
    if [ $c -eq 3 ]; then
        break 2
    fi
done
