# Step 1: Use an official Tomcat image with Java 11
FROM tomcat:9.0-jdk11-openjdk-slim

# Step 2: Set the working directory inside the container
WORKDIR /usr/local/tomcat

# Step 3: Remove the default "ROOT" application that comes with Tomcat
# This ensures your hotel app becomes the main site (accessible at http://ip:8081/)
RUN rm -rf webapps/ROOT

# Step 4: Copy the WAR file from the Jenkins 'target' folder into Tomcat's webapps
# Note: Maven generates the file in 'target/'. We rename it to ROOT.war
COPY target/*.war webapps/ROOT.war

# Step 5: Expose port 8080 (the default Tomcat port)
EXPOSE 8080

# Step 6: Start Tomcat###
CMD ["catalina.sh", "run"]
