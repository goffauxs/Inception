#!/bin/sh

chown -R mysql:mysql /var/lib/mysql

if [ ! -d /var/lib/mysql/$MYSQL_DATABASE ]; then
	echo "-- Starting service"
	service mysql start

	mkdir -p /var/run/mysqld
	touch /var/run/mysqld/mysqlf.pid
	mkfifo /var/run/mysqld/mysqlf.sock

	mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
	mysql -u root -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
	mysql -u root -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';"
	mysql -u root -e "FLUSH PRIVILEGES;"

	mysqladmin -u root password $MYSQL_ROOT_PASSWORD;
	
	echo "-- Stopping service"
	service mysql stop
else
	mkdir /var/run/mysqld
	touch /var/run/mysqld/mysqlf.pid
	mkfifo /var/run/mysqld/mysqlf.sock
fi

chown -R mysql /var/run/mysqld

exec "$@"