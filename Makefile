#!make

.PHONY: help outdated console server test

help: ## Shows this help.
	@IFS=$$'\n' ; \
	help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//'`); \
	for help_line in $${help_lines[@]}; do \
		IFS=$$'#' ; \
		help_split=($$help_line) ; \
		help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		printf "%-15s %s\n" $$help_command $$help_info ; \
	done

console: ## Open rails console.
	RAILS_LOG_LEVEL="debug" bin/rails console

sandbox: ## Open rails console in sandbox.
	RAILS_LOG_LEVEL="debug" bin/rails console --sandbox

server: ## Starts the server.
	RAILS_LOG_LEVEL="debug" bin/rails server

migrate: 
	bin/rails db:migrate

rollback:
	bin/rails db:rollback

outdated: ## Shows outdated packages.
	bundle outdated

routes:
	bin/rails routes

test:
	bin/rspec
