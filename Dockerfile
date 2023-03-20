# FROM maven:3-jdk-17-alpine AS build
FROM maven:3.8.3-openjdk-17 as build

#build stage
WORKDIR /opt/app
COPY ./ /opt/app
# RUN mvn clen install -DskipTests (flag to skip all tests)
RUN mvn clean install -DskipTests

#build image docker
FROM openjdk:17-jdk-alpine
COPY --from=build /opt/app/target/*jar app.jar

ENV PORT 8080
EXPOSE $PORT
ENTRYPOINT ["java", "-jar", "-Xmx1024M", "-Dserver.port=${PORT}", "app.jar"]