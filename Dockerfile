FROM debian:bullseye-slim


ENV KAFKA_VERSION=3.6.1
ENV SCALA_VERSION=2.13

# Install Kafka
RUN apt-get update && \
    apt-get install -y wget openjdk-17-jdk netcat && \
    wget https://archive.apache.org/dist/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz && \
    tar -xzf kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz && \
    mv kafka_${SCALA_VERSION}-${KAFKA_VERSION} /opt/kafka && \
    rm kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz

# Add Kafka binaries to PATH
ENV PATH="~/kafka_2.13-3.6.1/bin:$PATH"

# Expose ports
EXPOSE 9092 2181

# Add launch script
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
