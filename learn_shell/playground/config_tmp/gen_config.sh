#!/bin/bash

ROOT_DIR=$(dirname "${BASH_SOURCE[0]}")/../..
# echo $ROOT_DIR

if [ $# -ne 2 ]; then
    echo "Usage: $(basename "$0") scripts/environment.sh configs/iam-apiserver.yaml"
    exit 1
fi

source "$1"

# 检查模板中的变量是否都已经定义
# https://stackoverflow.com/questions/3601515/how-to-check-if-a-variable-is-set-in-bash

for env_name in $(sed -n 's/^[^#].*${\(.*\)}.*/\1/p' $2); do
    if [ -z "$(eval echo \$${env_name})" ]; then
        echo "Error: $env_name is not defined" >&2
        exit 1
    fi
done

eval "cat <<EOF
$(cat $2)
EOF
"
