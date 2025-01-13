# Java-web-container
This repository contains a Dockerfile image filled with Java toolkits, current use case is on Java web application deployment, running on Alpine linux for it's *fun-sized* operating system size.

## Tools installed in the Docker container
- OpenJDK11
- Apache Tomcat 10.1
- Gradle

## How to run
Pull the image from the Docker Hub repository by executing the command `docker pull kale0602/alpine-java-webapp-container`.

or

Build the application using this command `docker build . -t {preferred docker image name here}` then run it using docker-compose or `docker run {preferred docker image name here} -p 8080:8080` then watch it run.
