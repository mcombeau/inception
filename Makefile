all: up

up: setup
	docker-compose -f ./srcs/docker-compose.yml up -d

down:
	docker-compose -f ./srcs/docker-compose.yml down

start:
	docker-compose -f ./srcs/docker-compose.yml start

stop:
	docker-compose -f ./srcs/docker-compose.yml stop

status:
	docker ps

setup:
	mkdir -p ${HOME}/inception
	mkdir -p ${HOME}/inception/data
	mkdir -p ${HOME}/inception/data/mariadb-data
	mkdir -p ${HOME}/inception/data/wordpress-data

clean:
	rm -rf ${HOME}/inception

fclean: clean
	docker system prune -f

.PHONY: up down start stop status prune clean fclean
