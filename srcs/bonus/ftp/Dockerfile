FROM debian:buster

RUN	apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y vsftpd ftp

COPY tools/script.sh /tmp/ftp/
COPY tools/vsftpd.conf /etc/

CMD ["sh", "/tmp/ftp/script.sh"]
