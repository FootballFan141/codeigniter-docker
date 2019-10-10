.PHONY: build up down

build:
	docker-compose -p ${PROJECT_NAME} build

up:
	docker-compose -p ${PROJECT_NAME} up -d

stop:
	docker-compose -p ${PROJECT_NAME} stop

ps:
	docker-compose -p ${PROJECT_NAME} ps

down:
	docker-compose -p ${PROJECT_NAME} down

test:
	sh testing.sh ${PROJECT_NAME}
