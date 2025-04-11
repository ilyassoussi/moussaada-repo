FROM openjdk:17-jdk

ENV KAFKA_VERSION=3.6.1
ENV SCALA_VERSION=2.13

# Install Kafka
RUN apt-get update && \
    apt-get install -y wget netcat && \
    wget https://downloads.apache.org/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz && \
    tar -xzf kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz && \
    mv kafka_${SCALA_VERSION}-${KAFKA_VERSION} /opt/kafka && \
    rm kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz

# Add Kafka binaries to PATH
ENV PATH="/opt/kafka/bin:$PATH"

# Expose ports
EXPOSE 9092 2181

# Add launch script
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
