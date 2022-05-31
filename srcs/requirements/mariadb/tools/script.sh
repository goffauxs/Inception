#!/bin/sh

envsubst < /tmp/mariadb/setup.sql > /tmp/mariadb/setup_with_env.sql

if [ ! -d /var/lib/mysql/$MYSQL_DATABASE ]; then
	echo "-- Starting service"
	service mysql start
	echo "-- Applying sql file"
	mysql -D mysql < /tmp/mariadb/setup_with_env.sql
	echo "-- Stopping service"
	service mysql stop
	#mysqladmin shutdown
fi
echo "ALTER USER 'root'@'localhost' IDENTIFIED VIA mysql_native_password BY '$MYSQL_ROOT_PASSWORD';" > /var/lib/mysql/reset-pass
echo "-- Starting daemon"
exec mysqld_safe --init-file=/var/lib/mysql/reset-pass
