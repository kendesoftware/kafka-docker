FROM openjdk:8

RUN apt update && apt install -y wget

WORKDIR /tmp
RUN wget -q http://ftp.man.poznan.pl/apache/kafka/1.0.1/kafka_2.11-1.0.1.tgz
RUN tar -xzf kafka_2.11-1.0.1.tgz && mv kafka_2.11-1.0.1 /opt/kafka

COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

EXPOSE 2181

WORKDIR /opt/kafka
ENTRYPOINT start.sh
