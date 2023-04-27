#!/bin/bash

# 0代表STDIN,对于终端来说就是键盘,在使用输入重定向符号（<）时，Linux会用重定向指定的文件来替换标准输入文件描述符。
# 它会读取文件并提取数据，就如同它是键盘上键入的,可以使用重定向符将数据输入到任何能从STDIN接受数据的shell命令中

# 1代表STDOUT,在终端界面上，标准输出就是终端显示器,默认情况下，大多数bash命令会将输出导向STDOUT文件描述符,这样会在显示器上显示结果
# 可以通过重定向来将STDOUT重定向到文件中,这样就可以将命令的输出保存到文件中
# 但是在命令出错时,错误信息仍然会显示在显示器上,这是因为错误信息是通过STDERR文件描述符输出的,而不是STDOUT

# 2代表STDERR,shell或shell中运行的程序和脚本出错时生成的错误消息都会发送到这个位置,默认情况下，STDERR文件描述符会和STDOUT文件描述符指向同样的地方
# 但STDERR并不会随着STDOUT的重定向而发生改变,当重定向STDOUT时，STDERR仍然会显示在显示器上,我们常常会想改变这种行为，尤其是当你希望将错误消息保存到日志文件中的时候

# 在命令中重定向
# 1.只重定向错误: 2>
# ➜  4.output git:(master) ✗ ls -alh duie
# ls: cannot access 'duie': No such file or directory
# ➜  4.output git:(master) ✗ ls -alh duie 2>test
# ➜  4.output git:(master) ✗ cat test

# 2.重定向标准输出和标准错误: &> 当使用&>符时，命令生成的所有输出都会发送到同一位置，包括数据和错误,shell会赋予错误更高的优先级,显示在前面
# ➜  4.output git:(master) ✗ ls -alh duie &>test

# 在脚本中重定向输出
# 临时重定向,如果有意在脚本中生成错误消息，可以将单独的一行输出重定向到STDERR
echo "This is an error message" >&2 #这行会在脚本的STDERR文件描述符所指向的位置显示文本(此脚本 2>的位置)，而不是通常的STDOUT
echo "This is normal output"
# /bin/bash "/home/lei/script_kid/4.output/1_文件描述符.sh" 2>test 会发现error message在test中,而不是标准输出

# 永久重定向 如果脚本中有大量数据需要重定向，那重定向每个echo语句就会很烦琐，可以使用exec命令来重定向所有输出
exec 1>testout # 1> 重定向标准输出 exec命令会启动一个新shell并将STDOUT文件描述符重定向到文件
echo "This is a test of redirecting all output"
echo "from a script to another file."
echo "without having to redirect every individual line"
