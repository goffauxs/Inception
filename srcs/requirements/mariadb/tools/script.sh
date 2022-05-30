#!/bin/sh

envsubst < /tmp/mariadb/setup.sql > /tmp/mariadb/setup_with_env.sql

if [ ! -d /var/lib/mysql/$MYSQL_DATABASE ]; then
	echo "-- Starting service"
	service mysql start
	echo "-- executing sql script"
	mysql -D mysql < /tmp/mariadb/setup_with_env.sql
	echo "-- shutting service down"
	mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown
fi
exec mysqld_safe
