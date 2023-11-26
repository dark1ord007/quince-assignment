# Download dependencies
FROM maven:3.8.3-openjdk-17-slim AS dependency
WORKDIR /usr/app
COPY pom.xml .
RUN mvn dependency:go-offline

# Build JAR
FROM dependency as build
WORKDIR /usr/app
COPY src src
RUN mvn clean install

# Applcation Image
FROM openjdk:17-jdk-slim
WORKDIR /usr/app
RUN adduser java && chown -R java /usr/app
COPY --from=build /usr/app/target/demo-*.jar app.jar
EXPOSE 5000
USER java
CMD [ "java","-jar","app.jar" ]