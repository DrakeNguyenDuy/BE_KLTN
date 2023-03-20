# FROM maven:3-jdk-17-alpine AS build
FROM maven:3.8.3-openjdk-17 AS build

#build stage
# WORKDIR /opt/app
WORKDIR /opt/app

COPY --chown=root:root . /opt/app
# RUN mvn clean install -DskipTests (flag to skip all tests)
RUN mvn clean install -DskipTests

#build image docker
FROM openjdk:17-jdk-alpine

# COPY --chown=root:root --from=build /opt/app/target/*.jar app.jar

COPY --chown=root:root target/ /opt/app/target/*.jar app.jar

ENV PORT 8080
EXPOSE $PORT
CMD ["java", "-jar", "-Xmx1024M", "-Dserver.port=${PORT}", "app.jar"]