#!/bin/sh

cp /opt/kafka/config/zookeeper.properties /tmp/zookeeper.properties || exit 1

if [ ! -z $zookeeper_data_dir ]
then
  echo "dataDir=$zookeeper_data_dir" >> /tmp/zookeeper.properties
fi

if [ ! -z $zookeeper_client_port ]
then
  echo "clientPort=$zookeeper_client_port" >> /tmp/zookeeper.properties
fi

/opt/kafka/bin/zookeeper-server-start.sh /tmp/zookeeper.properties