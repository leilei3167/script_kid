#!/bin/bash

# 预先设置环境变量后可通过此函数来使用root权限执行某些命令
function run_with_sudo {
    if [ -z "${LINUX_PASSWORD}" ]; then # 没有设置密码
        echo "LINUX_PASSWORD is empty"
        exit 1
    fi

    echo ${LINUX_PASSWORD} | sudo -S $1
}

read -r -s -p "Enter your password: " LINUX_PASSWORD

echo "update apt..."
run_with_sudo "apt update -y"
echo

echo "upgrade apt..."
run_with_sudo "apt upgrade -y"
