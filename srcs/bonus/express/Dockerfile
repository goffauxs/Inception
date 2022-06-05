FROM debian:buster

RUN	apt-get upgrade -y && \
	apt-get update -y && \
	apt-get install -y curl

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -

RUN apt-get install -y nodejs

COPY tools/package*.json ./

RUN npm install

COPY tools/app/* ./

EXPOSE 80

CMD ["node", "index.js"]
