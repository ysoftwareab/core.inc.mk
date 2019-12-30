.PHONY: help
help: ## Show this help message.
	@echo "usage: `basename $(MAKE)` [targets]"
	@echo
	@echo "Available targets:"
	@for Makefile in $(MAKEFILE_LIST); do \
		($(GREP) "^\([^#.$$\t][^=]\+\):[^=]*\s##\s\+\(.\+\)\$$" $${Makefile} || true) | \
		$(SED) -E "s/^([^#.$$\t][^=]+):[^=]*[[:space:]]##[[:space:]]+(.+)\$$/  \1##\2/g"; \
	done | sort -u | column -t -s "##"


.PHONY: help-all
help-all: ## Show this help message, including all intermediary targets and source Makefiles.
	@echo "usage: `basename $(MAKE)` [targets]"
	@echo
	@echo "Available targets:"
	@for Makefile in $(MAKEFILE_LIST); do \
		($(GREP) "^\([^#.$$\t][^=]\+\):\([^=]*\s##\s\+\(.\+\)\)\?\$$" $${Makefile} || true) | \
		$(SED) -E "s|^([^#.$$\t][^=]+):([^=]*[[:space:]]##[[:space:]]+(.+))?\$$|  \1##$${Makefile#$(SUPPORT_FIRECLOUD_DIR)/}##\3|g"; \
	done | sort -u | column -t -s "##"
