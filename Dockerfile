FROM openjdk:8-alpine

RUN apk add --no-cache wget

WORKDIR /tmp
RUN wget -q http://ftp.man.poznan.pl/apache/kafka/1.0.1/kafka_2.11-1.0.1.tgz && tar -xzf kafka_2.11-1.0.1.tgz && mv /tmp/kafka_2.11-1.0.1 /opt/kafka && rm kafka_2.11-1.0.1.tgz

COPY start-standalone.sh /usr/local/bin/start-kafka.sh
RUN chmod +x /usr/local/bin/start-kafka.sh

COPY start-standalone.sh /usr/local/bin/start-zookeeper.sh
RUN chmod +x /usr/local/bin/start-zookeeper.sh

COPY start-standalone.sh /usr/local/bin/start-standalone.sh
RUN chmod +x /usr/local/bin/start-standalone.sh

VOLUME /var/lib/zookeeper
ENV zookeeper_data_dir /var/lib/zookeeper
ENV zookeeper_client_port 2181

VOLUME /var/lib/kafka
ENV kafka_logdir /var/lib/kafka

EXPOSE 2181
EXPOSE 9092

WORKDIR /opt/kafka
ENTRYPOINT start-standalone.sh
