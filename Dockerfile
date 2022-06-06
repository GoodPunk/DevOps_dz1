FROM tomcat:jre8-openjdk-slim-buster
RUN apt update && apt upgrade -y
RUN apt install git -y
RUN apt install maven -y
EXPOSE  8080
WORKDIR /tmp
RUN git clone https://github.com/GoodPunk/boxfuse-sample-java-war-hello.git
RUN mvn package ./boxfuse-sample-java-war-hello/pom.xml
COPY ./boxfuse-sample-java-war-hello/target /usr/local/tomcat/webapps
CMD ["catalina.sh" "run"]