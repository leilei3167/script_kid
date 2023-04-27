#!/bin/bash

# 将csv文件转换为sql文件
# read file and create INSERT statements for MySQL
outfile='members.sql'
IFS=',' # 设置分隔符为逗号
while read -r lname fname address city state zip; do
    cat >>$outfile <<EOF
 INSERT INTO members (\`lname\`,\`fname\`,\`address\`,\`city\`,\`state\`,\`zip\`) VALUES 
('$lname', '$fname', '$address', '$city', '$state', '$zip'); 
EOF

done <"${1}" # 从命令行参数中读取文件名,并将其作为输入重定向
