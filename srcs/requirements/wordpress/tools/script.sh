#!/bin/sh

rm -rf /var/www/html/wordpress/wp-config.php
wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost="mariadb" --path="/var/www/html/wordpress/" --allow-root --skip-check
wp core install --url="sgoffaux.42.fr" --title="sgoffaux's wordpress site" --admin_user="sgoffaux" --admin_password="42" --admin_email="sgoffaux@student.s19.be" --path="/var/www/html/wordpress/" --allow-root
wp user create lorem lorem@ipsum.fr --role=author --user_pass="123" --allow-root

exec php-fpm7.3 --nodaemonize
