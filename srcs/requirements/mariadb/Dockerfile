FROM debian:buster

RUN	apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y mariadb-server

COPY tools/my.cnf /etc/mysql

RUN echo "ALTER USER 'root'@'localhost' IDENTIFIED VIA mysql_native_password USING PASSWORD('${ROOT_PW}');" > /var/lib/mysql/pass-reset

CMD mysqld_safe --init-file=/var/lib/mysql/pass-reset
