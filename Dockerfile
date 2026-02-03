# Use a Java base image
FROM openjdk:17-jdk-slim

# Copy the JAR file built by Maven into the container
COPY target/*.jar app.jar

# Expose the port your hotel app runs on (usually 8080)#############
EXPOSE 8080

# Command to run the app
ENTRYPOINT ["java", "-jar", "/app.jar"]
