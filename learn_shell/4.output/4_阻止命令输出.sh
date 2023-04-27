#!/bin/bash
# 有时候，你可能不想显示脚本的输出。这在将脚本作为后台进程运行时很常见
# 如果在运行在后台的脚本出现错误消息，shell会通过电子邮件将它们发给进程的属主
# 要解决这个问题，可以将STDERR重定向到一个叫作/dev/null文件的特殊文件 shell输出到null文件的任何数据都不会保存，全部都被丢掉了
# 这是避免出现错误消息，也无需保存它们的一个常用方法

# 重定向到/dev/null的数据会被丢弃，不会显示在终端上，也不会保存到文件中
# ls -al hel >/dev/null 标准输出舍弃
# ls -al hel 2>/dev/null 标准错误舍弃

ls -al &>/dev/null # 同时舍弃错误和输出

# 也可用来快速清空文件,而不是删除后在创建!
echo "before testout:"
cat testout
echo
cat /dev/null >testout
echo "after testout:"
cat testout
