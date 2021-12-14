### Generic Variables
SHELL := /bin/zsh

.PHONY: help
help: ## Display help message (*: main entry points / []: part of an entry point)
	@grep -E '^[0-9a-zA-Z_-]+\.*[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

################################################################################
# TFD Demo MPLS ISIS-SR Topology
################################################################################

.PHONY: tfd-topology-build
tfd-topology-build: ## Run ansible playbook to build TFD MPLS ISIS-SR topology
	ansible-playbook tfd-mpls-topology-deploy.yml --tags build

.PHONY: tfd-topology-deploy
tfd-topology-deploy: ## Run ansible playbook to build and deploy TFD MPLS ISIS-SR topology
	ansible-playbook tfd-mpls-topology-deploy.yml --tags build,deploy

.PHONY: tfd-validate-state
tfd-validate-state: ## Run ansible playbook to validate TFD MPLS ISIS-SR topology
	ansible-playbook tfd-validate-state.yml --skip-tags hardware

.PHONY: tfd-validate-services
tfd-validate-services: ## Run ansible playbook to validate TFD MPLS ISIS-SR Services
	ansible-playbook tfd-validate-services.yml
