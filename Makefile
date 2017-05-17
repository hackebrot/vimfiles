VIM_CONFIG_DIR = $(HOME)/.config/nvim

.DEFAULT_GOAL := help

.PHONY: install
install: ## Create symlinks to vim config files
	@echo "+ $@"
	@mkdir -p $(VIM_CONFIG_DIR)
	@for file in $(shell find $(CURDIR)/config -type f -name "*.vim"); do \
		f=$$(basename $$file); \
		ln -sf $$file $(VIM_CONFIG_DIR)/$$f; \
	done


.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-10s\033[0m %s\n", $$1, $$2}'
