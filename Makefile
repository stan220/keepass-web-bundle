SHELL := /bin/sh
.DEFAULT_GOAL := help
.PHONY: *

help: ## Display available commands
	@printf "\033[0;36mAvailable commands:\033[0m\n"
	@IFS=$$'\n' ; \
	help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//'`); \
	for help_line in $${help_lines[@]}; do \
		IFS=$$'#' ; \
		help_split=($$help_line) ; \
		help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//' -e 's/:.*//' -e 's/://'` ; \
		help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		if [ "$$help_command" = "" ]; then \
			printf "\033[0;35m %-15s \033[0m \t\n" $$help_info ; \
		else \
			printf "\033[0;32m  %-20s \033[0m \t %s\n" $$help_command $$help_info ; \
		fi; \
	done

ifneq (,$(wildcard ./.env))
    include .env
    export
endif

## Docker Compose
up: ## Wake up local environment
	@printf "Starting environment \n"
	#chmod -R 777 log/ syncthing/

	docker compose up -d --build

	@printf "Environment is ready \n"

down: ## Shutdown local environment
	@printf "Shutting down the environment \n"
	docker compose down --remove-orphans
	@printf "Environment is down \n"

cert-add: ## Add TLS\SSL certificate
	docker compose start nginx-service
	docker exec -t nginx-container certbot --nginx -d ${SERVER_HOST} --register-unsafely-without-email
	@printf "Done \n"

cert-renew: ## Renew TLS\SSL certificate
	docker compose start nginx-service
	docker exec -t nginx-container certbot renew
	@printf "Done \n"
