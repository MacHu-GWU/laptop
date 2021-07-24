# -*- coding: utf-8 -*-

help: ## ** Show this help message
	@perl -nle'print $& if m{^[a-zA-Z0-9_-]+:.*?## .*$$}' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-40s\033[0m %s\n", $$1, $$2}'


macos: ## Setup ubuntu for developer
	bash ./macos.sh


amz-linux2: ## Setup amazon linux2 for developer
	bash ./amz-linux2.sh


redhat: ## Setup redhat for developer
	bash ./redhat.sh


ubuntu: ## Setup ubuntu for developer
	bash ./ubuntu.sh
