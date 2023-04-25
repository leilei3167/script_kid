#!/bin/bash
# getopts optstring variable
# 与getopt不同，前者将命令行上选项和参数处理后只生成一个输出，而getopts命令能够
# 和已有的shell参数变量配合默契,。getopts命令将当前参数保存在命令行中定义的variable中
# 如果要去掉错误消息,在optstring前加冒号,如果某个选项需要参数,在optstring后加冒号
echo
while getopts :ab:c opt; do # 忽略错误消息,并且b后面可以更参数值
    case "$opt" in          # 一次处理,每次参数都会保存在opt变量中
    # 会自动移除减号
    a) echo "Found the -a option" ;;
    b) echo "Found the -b option, with value $OPTARG" ;; # 选项需要跟一个参数值，OPTARG环境变量就会保存这个值
    c) echo "Found the -c option" ;;
    *) echo "Unknown option: $opt" ;;
    esac
done

# OPTIND环境变量保存了参数列表中getopts正在处理的参数位置,便于循环完毕后从何处开始处理参数
shift $((OPTIND - 1))
#
echo
count=1
for param in "$@"; do
    echo "Parameter $count: $param"
    count=$((count + 1))
done

# getopts可以处理带空格的参数 -ac -b "you hsa"
# 也可以将选项和参数放在一起 -acbfuck
# 并且会将未知的选项处理为?,当出现?时,可以选择之间打印帮助页面后退出
