FROM fedora:25
MAINTAINER Michael Epley, michaelepley@gmail.com

ENV JAVA_OPENJDK_VERSION=1.8.0.121 JAVA_OPENJDK_BUILD_VERSION=10.b14.fc24 JAVA_HOME=/usr/java/latest

# Upgrading system
RUN yum clean all && yum -y install java-1.8.0-openjdk java-1.8.0-openjdk-devel

# Download and install Oracle Java
# RUN wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION-$BUILD_VERSION/jdk-$JAVA_VERSION-linux-x64.rpm" -O /tmp/jdk-8-linux-x64.rpm && yum -y install /tmp/jdk-8-linux-x64.rpm

RUN    alternatives --install /usr/bin/java jar /usr/java/latest/bin/java 200000 \
    && alternatives --install /usr/bin/javaws javaws /usr/java/latest/bin/javaws 200000 \
    && alternatives --install /usr/bin/javac javac /usr/java/latest/bin/javac 200000

# User name is rot-0 encoded "java"
USER 101221
