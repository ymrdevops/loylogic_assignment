FROM openjdk:8-jdk-alpine
COPY /mnt/spring-petclinic-2.5.0-SNAPSHOT.jar spring-petclinic-2.5.0-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","spring-petclinic-2.5.0-SNAPSHOT.jar"]

