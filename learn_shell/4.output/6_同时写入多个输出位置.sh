#!/bin/bash
# 将输出同时发送到显示器和日志文件，这种做法有时候能够派上用场。你不用将输出重定向
# 两次，只要用特殊的tee命令就行。
# tee命令相当于管道的一个T型接头。它将从STDIN过来的数据同时发往两处。一处是
# STDOUT，另一处是tee命令行所指定的文件名
# tee命令相当于管道的一个T型接头。它将从STDIN过来的数据同时发往两处
# 注意，默认情况下，tee命令会在每次使用时覆盖输出文件内容,使用-a选项可以追加内容
# date | tee date.txt -a

tempfile=test22file
echo "This is the start of the test" | tee $tempfile
echo "This is the second line of the test" | tee -a $tempfile
echo "This is the end of the test" | tee -a $tempfile
