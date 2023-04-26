#!/bin/bash

# bash shell会将函数当作小型脚本来对待。这意味着你可以像普通脚本那样向函数传递参数
function addem {
    if [ $# -eq 0 ] || [ $# -gt 2 ]; then
        echo -1
    elif [ $# -eq 1 ]; then
        echo $(($1 + $1))
    else
        echo $(($1 + $2))
    fi
}

# 传递参数给函数
echo -n "Adding 10 and 15: "
value=$(addem 10 15)
echo $value
echo -n "Let's try adding just one number: "
value=$(addem 10)
echo $value
echo -n "Now trying adding no numbers: "
value=$(addem)
echo $value
echo -n "Finally, try adding three numbers: "
value=$(addem 10 15 20)
echo $value

echo
echo "给脚本的参数函数是没有办法使用的"
# 由于函数使用特殊参数环境变量作为自己的参数值，因此它无法直接获取脚本在命令行中的参数值。
function badfunc1 {
    echo $(($1 * $2)) # 尽管函数也使用了$1和$2变量，但它们和脚本主体中的$1和$2变量并不相同
}
if [ $# -eq 2 ]; then
    value=$(badfunc1) # 正确用法:value=$(badfunc1 $1 $2)
    echo "The result is $value"
else
    echo "Usage: badtest1 a b"
fi
