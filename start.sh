#!/bin/bash

# Lancer Zookeeper en arrière-plan
/opt/kafka/bin/zookeeper-server-start.sh /opt/kafka/config/zookeeper.properties &

# Attendre que Zookeeper démarre
sleep 5

# Lancer Kafka
/opt/kafka/bin/kafka-server-start.sh /opt/kafka/config/server.properties
