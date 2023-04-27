#!/bin/bash
# -t选项会强制mktemp命令来在系统的临时目录来创建该文件。在用这个特性时，mktemp命
# 令会返回用来创建临时文件的全路径，而不是只有文件名
tempfile=$(mktemp -t tmp.XXXXXX)
echo "This is a test file." >$tempfile
echo "This is the second line of the test." >>$tempfile
echo "The temp file is located at: $tempfile"
cat $tempfile
rm -f $tempfile

# 创建临时目录
tempdir=$(mktemp -d dir.XXXXXX)
cd $tempdir
# 创建临时文件储存输出
tempfile1=$(mktemp temp.XXXXXX)
tempfile2=$(mktemp temp.XXXXXX)
exec 7>$tempfile1
exec 8>$tempfile2
echo "Sending data to directory $tempdir"
echo "This is a test line of data for $tempfile1" >&7
echo "This is a test line of data for $tempfile2" >&8
