FROM tomcat:jre8-openjdk-slim-buster
RUN apt update && apt upgrade -y
RUN apt install git -y
EXPOSE  8080
RUN git clone https://github.com/GoodPunk/boxfuse-sample-java-war-hello.git /tmp/
RUN mvn package /tmp/boxfuse-sample-java-war-hello/pom.xml
RUN cp /tmp/boxfuse-sample-java-war-hello/target /usr/local/tomcat/webapps
CMD ["catalina.sh" "run"]