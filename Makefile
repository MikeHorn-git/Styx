VM_DIR   := vagrant
VMs      := windows10 windows11 windows2025

.DEFAULT_GOAL := help
.ONESHELL:

help:
	@echo "Usage: make <target>"
	@echo "Targets:"
	@printf "  %-15s %s\n" "help"   "Display this help message"
	@$(foreach vm,$(VMs), printf "  %-15s %s\n" "$(vm)" "Deploy $(vm)";)
	@printf "  %-15s %s\n" "clean"  "Destroy all VMs"

$(VMs):
	@cd $(VM_DIR)/$@
	@vagrant up

clean:
	@for vm in $(VMs); do \
		(cd $(VM_DIR)/$$vm && vagrant destroy -f); \
	done

.PHONY: help $(VMs) clean all test
