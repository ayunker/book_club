console:
	RAILS_LOG_LEVEL="debug" bin/rails console

server: ## Starts the server.
	RAILS_LOG_LEVEL="debug" bin/rails server -p 3001

dev:
	bin/dev

migrate: 
	bin/rails db:migrate

rollback:
	bin/rails db:rollback

seed:
	bin/rails db:seed

outdated: ## Shows outdated packages.
	bundle outdated

routes:
	bin/rails routes
