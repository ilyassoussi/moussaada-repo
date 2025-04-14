#!/bin/bash

# Lancer Zookeeper en arrière-plan
~/kafka_2.13-3.6.1/bin/zookeeper-server-start.sh ~/kafka_2.13-3.6.1/config/zookeeper.properties &

# Attendre que Zookeeper démarre
sleep 5

# Lancer Kafka
~/kafka_2.13-3.6.1/bin/kafka-server-start.sh ~/kafka_2.13-3.6.1/config/server.properties
