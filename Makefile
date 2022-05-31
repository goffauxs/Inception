HOME_DIR != getent passwd $(SUDO_USER) | cut -d: -f6;

all:
	mkdir -p ${HOME_DIR}/data/php_nginx
	mkdir -p ${HOME_DIR}/data/db
	docker-compose -f srcs/docker-compose.yml build
	docker-compose -f srcs/docker-compose.yml up

stop:
	docker-compose -f srcs/docker-compose.yml down

install:
	@apt-get update
	@apt-get install -y ca-certificates curl gnupg lsb-release
	@mkdir -p /etc/apt/keyrings
	@curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
	@echo \
	"deb [arch=$(shell dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
	$(shell lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
	@apt-get update
	@apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin docker-compose
	@sh -c -e "echo '127.0.0.1 sgoffaux.42.fr' >> /etc/hosts";
	@sh -c -e "echo '127.0.0.1 www.sgoffaux.42.fr' >> /etc/hosts";

clean:
	docker volume ls -q | xargs -r docker volume rm
	docker system prune -af

fclean: stop clean
	sudo rm -rf ${HOME_DIR}/data

re: fclean all

.PHONY: all clean fclean re
