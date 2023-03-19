# FROM maven:ibmjava
# FROM java:6-jdk
# ENV MAVEN_VERSION 3.8.5
# ENV MAVEN_HOME D:\apache-tomcat-9.0.62
# ENV PATH $MAVEN_HOME/bin:$PATH
# WORKDIR /app
# RUN apt-get update && \
#     apt-get install -y maven
# RUN mvn clean package
# CMD ["mvn", "spring-boot:run"]
# EXPOSE 8090
# Sử dụng image base chứa Java
FROM openjdk:11-jdk-slim

# Thiết lập biến môi trường JAVA_HOME
ENV JAVA_HOME /usr/local/openjdk-11

# Thêm biến MAVEN vào biến PATH
ENV MAVEN_HOME C:/Program Files/apache-maven-3.8.5
ENV PATH $MAVEN_HOME/bin:$PATH

# Copy file pom.xml và source code vào image
COPY . /shopizer

# Thiết lập thư mục làm việc
WORKDIR /app

# Build bằng Maven
RUN mvn clean package

# Thiết lập lệnh CMD
CMD ["java", "-jar", "target/app.jar"]
