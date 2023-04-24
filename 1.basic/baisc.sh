#! /bin/bash
echo -n "the time is:"
date
echo "helle you're in test1.sh"

# 使用美元符来引用环境变量
echo "User info is $USER"
echo "UID: $UID"
echo "HOME: $HOME"
# 花括号更加清晰
echo "PATH: ${PATH}"

# 原样输出特殊字符需要反斜线转义
echo "I hava \$15"

# 变量区分大小写
days=10
guest="Kitty"
echo "${guest} checked in $days days ago"

guest2=$guest # 正确,引用变量必须加美元符,如果不加,将原样输出$guest
# guest2=guest # 错误
echo "$guest2 checked in $days days ago"

# 命令替换,将命令的输出结果赋值给变量
# $() 格式
date_now=$(date)
echo "the time is $date_now"

# 常用于生成日志文件名
today=$(date +%Y%m%d)
ls /usr/bin >log."$today"

# ``格式 不推荐,已废弃

# 重定向 在命令行上，命令总是在左侧，而重定向符号“指向”数据流动的方向
# 输出重定向
# > 会覆盖目标文件的原有数据
# >> 不会覆盖目标文件的原有数据,而是在文件末尾追加数据

# 输入重定向
# < 如 wc < who.txt wc命令从文件who.txt中读取数据统计行数,词数,字节数

# 内联输入重定向 <<

# 管道 |
# 不要以为由管道串起的两个命令会依次执行。Linux系统实际上会同时运行这两个命令，在
# 系统内部将它们连接起来。在第一个命令产生输出的同时，输出会被立即送给第二个命令。数据
# 传输不会用到任何中间文件或缓冲区
# ls /usr/bin | sort | less
