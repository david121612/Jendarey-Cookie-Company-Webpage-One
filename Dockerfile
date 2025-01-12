# Use the official Tomcat image as the base image
FROM tomcat:10.1.14-jdk17

# Set metadata for the image
LABEL author="Akin"
LABEL project="Jendarey-Cookie-Company-Webpage-Project"

# Install required dependencies
RUN apt-get update && apt-get install -y maven git && rm -rf /var/lib/apt/lists/*

# Copy the application repository to the image
COPY . /app

# Build the application using Maven
WORKDIR /app
RUN mvn clean package

# List the contents of the target directory for debugging
RUN ls -l /app/target

# Remove the default Tomcat applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the .war file into the Tomcat webapps directory
COPY /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080 for the application
EXPOSE 8080

# Define the default command to start Tomcat
CMD ["catalina.sh", "run"]
# docker build . -t jendaredocker/jendarey-cookie-company-webpage-main
# docker run -d -p 18900:8080 --name=cookies-webpage jendaredocker/jendarey-cookie-company-webpage-main:v1
# docker run -d -p 19900:8080 --name=cookies-web jendaredocker/jendarey-cookie-company-webpage-main:v2



# docker-compose up
# docker exec -it ac7 bash 
# ls /usr/local/tomcat/logs
# cat /usr/local/tomcat/logs
# docker logs jendarey-tech-mongo-1
# docker run -d -p 14000:8080 --name=voting-app4 jendaredocker/Jendarey-Cookie-Company-Webpage-main:latest
# docker run -d -p 16000:8080 --name=cookies-web jendaredocker/jendarey-cookie-company-webpage-main:latest
# docker pull 10.1.13-jdk17
# Copy the .war file to the `webapps` directory
# docker cp target/a23-webpage.war tomcat:10.1.13-jdk17:/usr/local/tomcat/webapps/
# Start the Tomcat container
# docker run -it -p 8080:8080 tomcat:10.1.13-jdk17
# docker compose up
# docker exec -it ac7 bash 
# /usr/local/tomcat/logs#
# docker logs jendarey-tech-mongo-1
