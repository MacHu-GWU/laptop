.PHONY: help
help: ## ** Show this help message
	@perl -nle'print $& if m{^[a-zA-Z0-9_-]+:.*?## .*$$}' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-40s\033[0m %s\n", $$1, $$2}'


.PHONY: setup-brew
setup-brew: ## ** Install homebrew
	@bash ./mac-setup-homebrew.sh


.PHONY: setup-linux-tools
setup-linux-tools: setup-brew ## ** Set Up useful Linux tools
	@bash ./mac-setup-linux-tools.sh


.PHONY: setup-python
setup-python: setup-linux-tools ## ** Set Up Python Development Tools
	@bash ./mac-setup-python.sh


.PHONY: setup-ruby
setup-ruby: setup-linux-tools ## ** Set Up Ruby Development Tools
	@bash ./mac-setup-ruby.sh


.PHONY: setup-aws
setup-aws: setup-linux-tools ## ** Set Up Ruby Development Tools
	@bash ./mac-setup-aws.sh


.PHONY: setup-sanhe
setup-sanhe: setup-python setup-aws ## ** Set Up Sanhe Hu's development laptop
	# Python + AWS


.PHONY: setup-amazon-linux-for-python36
setup-amazon-linux-for-python36: ## ** Set Up Python3.6 with pyenv and virtualenv
	@bash ./amazon-linux-setup-python36.sh
