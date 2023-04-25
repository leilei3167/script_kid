#!/bin/bash
# 有时你会想在终端会话中启动shell脚本，然后让脚本一直以后台模式运行到结束，即使你退
# 出了终端会话(单纯用&行不通,在终端退出后将会终止后台任务)。这可以用nohup命令来实现
# 当你使用nohup命令时，如果关闭该会话，脚本会忽略终端会话发过来的SIGHUP信号。
# 由于nohup命令会解除终端与进程的关联，进程也就不再同STDOUT和STDERR联系在一起。
# 为了保存该命令产生的输出，nohup命令会自动将STDOUT和STDERR的消息重定向到一个名为
# nohup.out的文件中
# 如果使用nohup运行了另一个命令，该命令的输出会被追加到已有的nohup.out文件中。当
# 运行位于同一个目录中的多个命令时一定要当心，因为所有的输出都会被发送到同一个
# nohup.out文件中，结果会让人摸不清头脑。

# Test job control
#
echo "Script Process ID: $$"
#
count=1
while [ $count -le 10 ]; do
    echo "Loop #$count"
    sleep 10
    count=$(($count + 1))
done
#
echo "End of script..."

# 程序进入后台后 使用jobs -l查看作业
