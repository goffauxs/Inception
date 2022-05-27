HOME_DIR = /home/sgoffaux

all:
	mkdir -p ${HOME_DIR}/data/php_nginx
	mkdir -p ${HOME_DIR}/data/db
	docker-compose -f srcs/docker-compose.yml build
	docker-compose -f srcs/docker-compose.yml up

stop:
	docker-compose -f srcs/docker-compose.yml down

clean:
	docker volume ls -q | xargs -r docker volume rm
	docker system prune -af

fclean: stop clean
	sudo rm -rf ${HOME_DIR}/data

re: fclean all

.PHONY: all clean fclean re
