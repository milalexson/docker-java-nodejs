FROM ubuntu
MAINTAINER Miladin Tripic

RUN apt-get install default-jdk -y
RUN apt-get install nodejs -y
RUN apt-get install wget -y