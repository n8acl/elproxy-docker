FROM openjdk:10-jre-slim
MAINTAINER n8acl@protonmail.com
COPY * /usr/app/
WORKDIR /usr/app/
EXPOSE 8200
EXPOSE 5198/udp
EXPOSE 5199/udp
EXPOSE 5200
ENTRYPOINT ["java","-jar","EchoLinkProxy.jar"]
