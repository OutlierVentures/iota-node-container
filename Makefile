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

build-app: 
	@echo "\nBuilding docker app container..."
	docker-compose -p iota-app-${IOTA_COMPOSE_ENV} stop app
	docker-compose -p iota-app-${IOTA_COMPOSE_ENV} build app
	docker-compose -p iota-app-${IOTA_COMPOSE_ENV} up -d app

rebuild-app:
	@echo "\nBuilding docker app container with --no-cache..."
	docker-compose -p iota-app-${IOTA_COMPOSE_ENV} stop app
	docker-compose -p iota-app-${IOTA_COMPOSE_ENV} build --no-cache app
	docker-compose -p iota-app-${IOTA_COMPOSE_ENV} up -d app

build-node:
	@echo "\nBuilding Iota node container..."
	docker-compose -p iota-node-${IOTA_COMPOSE_ENV} stop iota_node
	docker-compose -p iota-node-${IOTA_COMPOSE_ENV} build iota_node
	docker-compose -p iota-node-${IOTA_COMPOSE_ENV} up -d iota_node

help:
	@echo "\n----------"
	@echo "\nmake start - start the docker containers"
	@echo "\nmake stop - stop the docker containers"
	@echo "\nmake build-node - build the Iota node container"
	@echo "\nmake build-app - build the app container"
	@echo "\n----------"
