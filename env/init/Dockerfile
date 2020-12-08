FROM debian:buster

RUN apt-get update && apt-get install -y git

COPY ./init.sh /init.sh

WORKDIR /var/services

CMD bash /init.sh