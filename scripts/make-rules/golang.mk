
# 定义编译选项

# ?=表示 如果变量已经被定义过，则不会再次被赋值
GO_SUPPORTED_VERSIONS ?= 1.13|1.14|1.15|1.16|1.17|1.18|1.19|1.20 
GO_LDFLAGS +=

# 以模块名.目标名的方式来命名
# 构建,先检查，再编译
.PHONY: go.build
go.build: go.build.verify
	@echo "假装执行go build"
	@echo "done"


.PHONY: go.build.verify
go.build.verify: 
	@echo "假装执行go build verify验证go版本是否支持"
	@echo "done"