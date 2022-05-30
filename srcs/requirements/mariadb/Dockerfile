FROM debian:buster

RUN	apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y mariadb-server gettext-base

WORKDIR /tmp/mariadb/

COPY tools/my.cnf /etc/mysql

COPY tools/setup.sql /tmp/mariadb/

COPY tools/script.sh /tmp/mariadb/

EXPOSE 3306

CMD ["sh", "/tmp/mariadb/script.sh"]

