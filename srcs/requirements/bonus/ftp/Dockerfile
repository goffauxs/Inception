FROM debian:buster

RUN	apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y vsftpd ftp

COPY tools/script.sh /tmp/ftp/

RUN sh /tmp/ftp/script.sh

CMD vsftpd
