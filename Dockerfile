FROM onsdigital/java-component

RUN apt-get install -y vim wget curl nodejs default-jdk
RUN export JAVA_HOME=/usr/bin
RUN ln -s /usr/bin/nodejs /usr/bin/node

ADD startCMD.sh /
