#!/bin/bash

# 要让替换命令能够替换一行中不同地方出现的文本必须使用替换标记（substitution flag）。替换标
# 记会在替换命令字符串之后设置 即 s/old/new/flag
echo "原始文件内容:"
cat data4.txt

echo
echo
echo "默认只会每一行替换第一个匹配的字符串"
sed 's/test/trial/' data4.txt # 只会每一行替换第一个匹配的字符串

# 有四种标记
# g: 全局替换,所有替换而不是仅仅替换每一行中第一个匹配的字符串
# p: 原先行的内容要打印出来
# w file: 将替换的结果写入文件
# number: 只替换第number个匹配的字符串 如为2时,sed编辑器只替换每行中第二次出现的匹配模式
echo
echo
echo "为数字2时,只会替换每一行第二次出现的匹配项"
sed 's/test/trial/2' data4.txt

echo
echo
echo "p替换标记会打印与替换命令中指定的模式匹配的行。这通常会和sed的-n选项一起使用"
# -n选项将禁止sed编辑器输出。但p替换标记会输出修改过的行。将二者配合使用的效果就是
# 只输出被替换命令修改过的行
sed -n 's/test/trial/p' data4.txt

echo
echo
echo "# w替换标记会产生同样的输出，不过会将输出保存到指定文件中"
sed 's/test/trial/w dataw.txt' data4.txt

# #
# ，如果想用C shell替换/etc/passwd文件中的bash shell，
# 必须这么做：
# $ sed 's/\/bin\/bash/\/bin\/csh/' /etc/passwd
# 要解决这个问题，sed编辑器允许选择其他字符来作为替换命令中的字符串分隔符：
# $ sed 's!/bin/bash!/bin/csh!' /etc/passwd
# 在这个例子中，感叹号被用作字符串分隔符，这样路径名就更容易阅读和理解了
