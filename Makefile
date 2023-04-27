# 默认会把第一个目标作为默认执行的目标,也可以设置下述变量来指定运行默认的目标
# .DEFAULT_GOAL := help


# 在命令面前加上@可以阻止make在执行命令时输出该命令本身,只显示命令产生的结果

.PHONY: all
all:
	@echo "一般会把all作为默认目标，这样在执行make时，就会自动执行all目标下的命令。"
	@echo "假装做很多事"
	@echo "done"

# ==============================================================================
# 此处来引入其他的Makefile文件,可以是相对路径或绝对路径
# 最佳实践是在根目录Makefile中只保留一些通用的规则,其他的规则都放在子目录中,并且按照模块来划分文件
# 如和go相关的放在golang.mk下
# 和工具相关的放在tools.mk下
# 全部通用的放在common.mk下
# 和docker镜像相关的放在docker.mk下
include scripts/make-rules/common.mk # 因为其中定义了很多公用的变量因此必须放在最前面
OTHER_MK_FILES := $(filter-out scripts/make-rules/common.mk, $(wildcard scripts/make-rules/*.mk))
include $(OTHER_MK_FILES)

# ==============================================================================
.PHONY: build
build:
	@$(MAKE) go.build

.PHONY: tidy
tidy:
	@go mod tidy

# 进行单元测试并生成测试报告
.PHONY: test
test:
	@echo "假装执行单元测试"
	@echo "done"

# ==============================================================================
# 帮助信息,建议使用命令自动读取Makefile中的注释来生成帮助信息

.PHONY: help
help:
	@printf "\nUsage: make <TARGETS> <OPTIONS> ...\n\nTargets:\n"
