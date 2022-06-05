FROM debian:buster

RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y wget

WORKDIR /usr/bin/

RUN wget https://github.com/google/cadvisor/releases/download/v0.37.5/cadvisor

RUN chmod +x /usr/bin/cadvisor

CMD ["/usr/bin/cadvisor", "-logtostderr", "--port=7000"]