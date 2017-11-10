all: help

start:
	@echo "\nStarting docker containers..."
	docker-compose -p iota-app-${IOTA_COMPOSE_ENV} up -d
	docker ps

stop:
	@echo "\nStopping docker containers..."
	docker-compose -p iota-app-${IOTA_COMPOSE_ENV} down
	docker-compose -p iota-node-${IOTA_COMPOSE_ENV} down
	docker ps

restart: stop start

build-app: 
	@echo "\nBuilding docker app container..."
	docker-compose -p iota-app-${IOTA_COMPOSE_ENV} build app

rebuild-app:
	@echo "\nBuilding docker app container with --no-cache..."
	docker-compose -p iota-app-${IOTA_COMPOSE_ENV} build --no-cache app

build-node:
	@echo "\nBuilding Iota node container..."
	docker-compose -p iota-node-${IOTA_COMPOSE_ENV} build iota_node

rebuild-node:
	@echo "\nBuilding Iota node container..."
	docker-compose -p iota-node-${IOTA_COMPOSE_ENV} build --no-cache iota_node

help:
	@echo "\n----------"
	@echo "\nmake start - start the docker containers"
	@echo "\nmake stop - stop the docker containers"
	@echo "\nmake build-node - build the Iota node container"
	@echo "\nmake build-app - build the app container"
	@echo "\n----------"
