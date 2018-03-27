#!/bin/sh

cp /opt/kafka/config/server.properties /tmp/server.properties || exit 1

if [ ! -z $kafka_listeners ]
then
  echo "listeners=$kafka_listeners" >> /tmp/server.properties
fi

if [ ! -z $kafka_advertised_listeners ]
then
  echo "advertised.listeners=$kafka_advertised_listeners" >> /tmp/server.properties
fi

if [ ! -z $kafka_zookeeper_connect ]
then
  echo "zookeeper.connect=$kafka_zookeeper_connect" >> /tmp/server.properties
fi

if [ ! -z $kafka_logdir ]
then
  echo "log.dirs=$kafka_logdir" >> /tmp/server.properties
fi

/opt/kafka/bin/kafka-server-start.sh /tmp/server.properties
