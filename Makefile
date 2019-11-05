.PHONY: help
help: ## ** Show this help message
	@perl -nle'print $& if m{^[a-zA-Z0-9_-]+:.*?## .*$$}' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-40s\033[0m %s\n", $$1, $$2}'


#--- Mac Laptop ---
.PHONY: setup-mac-brew
setup-mac-brew: ## ** Install homebrew
	@bash ./mac-setup-homebrew.sh


.PHONY: setup-mac-linux-tools
setup-mac-linux-tools: setup-mac-brew ## ** Set Up useful Linux tools
	@bash ./mac-setup-linux-tools.sh


.PHONY: setup-mac-zsh-shell
setup-mac-zsh-shell: setup-mac-brew ## ** Set Up zsh shell
	@bash ./mac-setup-zsh.sh


.PHONY: setup-mac-python
setup-mac-python: setup-mac-linux-tools ## ** Set Up Python Development Tools
	@bash ./mac-setup-python.sh


.PHONY: setup-mac-ruby
setup-mac-ruby: setup-mac-linux-tools ## ** Set Up Ruby Development Tools
	@bash ./mac-setup-ruby.sh


.PHONY: setup-mac-aws
setup-mac-aws: setup-mac-linux-tools ## ** Set Up Ruby Development Tools
	@bash ./mac-setup-aws.sh


.PHONY: setup-mac-sanhe
setup-mac-sanhe: setup-mac-python setup-mac-aws ## ** Set Up Sanhe Hu's development laptop
	# Python + AWS


#--- Amazon Linux ---
.PHONY: setup-amazon-linux-for-python36
setup-amazon-linux-for-python36: ## ** Set Up Python3.6 with pyenv and virtualenv
	@sudo bash ./amazon-linux-setup-1-linux-deps.sh
	@bash ./amazon-linux-setup-2-pyenv.sh
	@sudo bash ./amazon-linux-setup-3-c-compiler-for-python.sh
	@bash ./amazon-linux-setup-4-python36.sh


.PHONY: setup-amazon-linux-for-docker
setup-amazon-linux-for-docker: ## ** Set Up docker
	@bash ./amazon-linux-setup-docker.sh
