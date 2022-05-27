#!/bin/sh

envsubst < /tmp/mariadb/setup.sql > /tmp/mariadb/setup_with_env.sql

#echo "Database created"
service mysql start
mysql < /tmp/mariadb/setup_with_env.sql
exec mysqld_safe
