LOGIN = 	login
DATA_PATH = /home/${LOGIN}/data

all: up

up: setup
	DATA_PATH=${DATA_PATH} docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	DATA_PATH=${DATA_PATH} docker-compose -f ./srcs/docker-compose.yml down

start:
	DATA_PATH=${DATA_PATH} docker-compose -f ./srcs/docker-compose.yml start

stop:
	DATA_PATH=${DATA_PATH} docker-compose -f ./srcs/docker-compose.yml stop

status:
	cd srcs && docker-compose ps && cd ..

logs:
	cd srcs && docker-compose logs && cd ..

setup:
	sudo mkdir -p /home/${LOGIN}/
	sudo mkdir -p ${DATA_PATH}
	sudo mkdir -p ${DATA_PATH}/mariadb-data
	sudo mkdir -p ${DATA_PATH}/wordpress-data

clean:
	sudo rm -rf ${DATA_PATH}

fclean: clean
	docker system prune -f

.PHONY: up down start stop status logs prune clean fclean
