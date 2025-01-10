# Use Alpine Linux image
FROM alpine:3.14

# Install gradle, openjdk11, and curl
RUN apk update\ 
    && apk add --no-cache curl bash openjdk11 gradle

# Set environment variables
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk
ENV CATALINA_HOME=/usr/local/tomcat

# Create a directory for Tomcat
RUN mkdir -p /usr/local/tomcat

# Curl the Tomcat tarball then extract it
WORKDIR /tmp
RUN curl -O https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.34/bin/apache-tomcat-10.1.34.tar.gz\
    && tar -xvf apache-tomcat-10.1.34.tar.gz -C /usr/local/tomcat --strip-components=1\
    && rm -f apache-tomcat-10.1.34.tar.gz

WORKDIR /usr/local/tomcat
COPY ./commons/tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml

# Expose the Tomcat port
EXPOSE 8080

# Check Tomcat version
WORKDIR /usr/local/tomcat/bin
CMD ["./catalina.sh", "run"]