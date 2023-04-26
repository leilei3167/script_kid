#!/bin/bash

# 一些公用的库函数的定义,如何被其他脚本调用?

function addem {
    echo $(($1 + $2))
}
function multem {
    echo $(($1 * $2))
}
function divem {
    if [ $2 -ne 0 ]; then
        echo $(($1 / $2))
    else
        echo -1
    fi
}
function factorial {
    if [ $1 -eq 1 ]; then
        echo 1
    else
        local temp=$(($1 - 1))
        local result=$(factorial $temp)
        echo $(($result * $1))
    fi
}
