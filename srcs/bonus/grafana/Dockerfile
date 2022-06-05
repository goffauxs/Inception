FROM debian:buster

RUN apt-get upgrade -y && \
	apt-get update -y && \
	apt-get install -y wget

RUN wget https://dl.grafana.com/oss/release/grafana-8.5.4.linux-amd64.tar.gz && \
	tar -zxvf grafana-8.5.4.linux-amd64.tar.gz

WORKDIR /grafana-8.5.4/

CMD ["./bin/grafana-server", "web"]