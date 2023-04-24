#! /bin/bash

# 数学表达式适用方括号(已被废弃,适用双括号代替)
var1=$((1 + 5))
echo $var1

var2=$((1 + 1000)) # 注意和命令替换的区别
echo $var2

var3=$((var1 / var2)) # 算术表达式中无需使用$取变量
echo $var3            # 只能进行整数运算,向下取整得到0,需要支持浮点运算,需要使用bc

var4=$(echo "scale=4;$var2/$var1" | bc) # scale表示小数点后保留几位
echo "$var4"

# bc能够识别重定向,允许将大量文件数据输出到bc中
varible=$(
    bc <<EOF
scale=4
a1=($var1*$var2)
a2=($var1/$var2)
a1+a2
EOF
)
echo Final result is "$varible"

# 退出脚本,使用退出状态码, $?表示上一条命令的退出状态码
# echo $? # 0表示成功,非0表示失败

# 默认情况下，shell脚本会以脚本中的最后一个命令的退出状态码退出
# exit 命令指定退出的状态码,$?就是exit传递出来的参数
# 常常被用于if-then来判断某个命令的错误状态,进行错误处理
exit 0
