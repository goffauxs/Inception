FROM debian:buster

RUN	apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y wget

WORKDIR /var/www/html/wordpress/

CMD wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php && \
	mv adminer-4.8.1.php adminer.php

