.PHONY: help
help: ## ** Show this help message
	@perl -nle'print $& if m{^[a-zA-Z_-]+:.*?## .*$$}' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


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