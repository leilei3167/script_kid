#!/bin/bash

# min hour dayofmonth month dayofweek command

# 15 10 * * * command # 每天10:15执行

# 15 16 * * 1 command # 每周一16:15执行

# 00 12 1 * * command # 每月1日12:00执行

# 如何设置每月最后一天执行?
# 00 12 L * * command # 每月最后一天12:00执行

# 每个系统用户（包括root用户）都可以用自己的cron时间表来运行安排好的任务。Linux提供
# 了crontab命令来处理cron时间表。要列出已有的cron时间表，可以用-l选项,要为cron时间表添加条目，可以用-e选项

# 如果你创建的脚本对精确的执行时间要求不高，用预配置的cron脚本目录会更方便。
# 有4个基本目录：hourly、daily、monthly和weekly。 如果脚本需要每天运行一次，只要将脚本复制到daily目录，cron就会每天执行它

# ls /etc/cron.*ly
