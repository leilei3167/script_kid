#!/bin/bash
# trap命令允许你来指定shell
# 脚本要监看并从shell中拦截的Linux信号。如果脚本收到了trap命令中列出的信号，该信号不再
# 由shell处理，而是交由本地处理
# trap commands signals
# 非常简单！在trap命令行上，你只要列出想要shell执行的命令，以及一组用空格分开的待捕
# 获的信号。你可以用数值或Linux信号名来指定信号。
# Modifying a set trap
#
trap "echo ' Sorry... Ctrl-C is trapped.'" SIGINT
#
count=1
while [ $count -le 5 ]; do
    echo "Loop #$count"
    sleep 1
    count=$(($count + 1))
done
# 修改只需要再次使用trap命令即可
trap "echo ' I modified the trap!'" SIGINT
#
count=1
while [ $count -le 5 ]; do
    echo "Second Loop #$count"
    sleep 1
    count=$(($count + 1))
done

# Remove the trap 只需要在trap命令与希望恢复默认行为的信号列表之间加上两个破折号就行了, 也可以在trap命令后使用单破折号来恢复信号的默认行为
# 移除信号捕获后，脚本按照默认行为来处理SIGINT信号，也就是终止脚本运行。
trap -- SIGINT
