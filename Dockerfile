FROM tomcat
RUN apt update && apt upgrade -y
RUN apt install git -y
RUN apt install maven -y
RUN git clone https://github.com/GoodPunk/boxfuse-sample-java-war-hello.git
RUN mvn package --file ./boxfuse-sample-java-war-hello/pom.xml
RUN cp ./boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/local/tomcat/webapps
EXPOSE  8080