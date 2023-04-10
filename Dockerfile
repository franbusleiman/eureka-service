FROM openjdk:8

WORKDIR /app

VOLUME /app/tmp

COPY ./mvnw .
COPY ./.mvn .mvn
COPY ./pom.xml .

RUN ./mvnw dependency:go-offline
RUN mkdir log

COPY ./src ./src

RUN ./mvnw clean package

EXPOSE 8761

CMD ["java", "-jar", "./target/eureka-service-0.0.1-SNAPSHOT.jar"]





