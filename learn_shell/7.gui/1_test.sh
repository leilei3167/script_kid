#!/bin/bash
# select命令只需要一条命令就可以创建出菜单，然后获取输入的答案并自动处理。select
# 命令的格式如下
# select variable in list
# do
#  commands
# done

function diskspace {
    clear
    df -k
}
function whoseon {
    clear
    who
}
function memusage {
    clear
    cat /proc/meminfo
}

PS3="Enter option: "
select option in "Display disk space" "Display logged on users" "Display memory usage" "Exit program"; do
    # 在使用select命令时，记住，存储在变量中的结果值是整个文本字符串而不是跟菜单选项
    # 相关联的数字。文本字符串值才是你要在case语句中进行比较的内容
    case $option in
    "Exit program") # 匹配字符串而不是数字
        break
        ;;
    "Display disk space")
        diskspace
        ;;
    "Display logged on users")
        whoseon
        ;;
    "Display memory usage")
        memusage
        ;;
    *)
        clear
        echo "Sorry, wrong selection"
        ;;
    esac
done
clear
