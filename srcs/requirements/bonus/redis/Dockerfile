FROM debian:buster

RUN	apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y redis-server

COPY tools/redis.conf /etc

CMD ["redis-server", "./", "--protected-mode", "no"]
