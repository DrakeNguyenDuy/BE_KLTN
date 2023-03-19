FROM maven:3-jdk-9-alpine AS build

#build stage
WORKDIR /app
COPY ./ /app
# RUN mvn clen install -DskipTests (flag to skip all tests)
RUN mvn clen install -DskipTests

#build image docker
FROM openjdk:17-jdk-alpine
COPY --from=build /app/targer/*jar app.jar

ENV PORT 8080
EXPOSE $PORT
ENTRYPOINT ["java", "-jar", "-Xmx1024M", "-Dserver.port=${PORT}", "app.jar"]