# 用来定义所有makefile中会使用的环境变量,如项目根目录等

# 定义使用的shell
SHELL := /bin/bash

COMMON_SELF_DIR := $(dir $(lastword $(MAKEFILE_LIST)))

# 定义项目根目录
ifeq ($(origin ROOT_DIR), undefined)
ROOT_DIR := $(abspath $(shell cd $(COMMON_SELF_DIR)/../.. && pwd -P))
endif

