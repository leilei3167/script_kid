#!/bin/bash

echo "bash_source: ${BASH_SOURCE[*]} "
echo "bash_source[0]: ${BASH_SOURCE[0]} "
echo "dirname bash_source[0]: $(dirname ${BASH_SOURCE[0]}) "
echo "dirname bash_source[0]/../..: $(dirname ${BASH_SOURCE[0]})/../.. "

#
ROOT="$(dirname "${BASH_SOURCE[0]}")/../.."
echo "ROOT: $ROOT"

echo "项目目录在: $(cd "$ROOT" && pwd -P)"
