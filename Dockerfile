FROM openjdk:8-jdk-alpine
VOLUME /tmp
ADD target/kumo-margarita-0.1.0.jar app.jar
ENV JAVA_OPTS=""
EXPOSE 8080
ENTRYPOINT exec java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar
