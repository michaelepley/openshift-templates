FROM fedora:latest

MAINTAINER michaelepley@gmail.com
# based loosely on 

ENV SPARK_VERSION=2.1.0 PATH=$PATH:/opt/spark/bin SPARK_HOME=/opt/spark

ARG DISTRO_LOC=https://dist.apache.org/repos/dist/release/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop2.7.tgz
ARG DISTRO_NAME=spark-${SPARK_VERSION}-bin-hadoop2.7

# when the containers are not run w/ uid 0, the uid may not map in /etc/passwd and it may not be possible to modify things like /etc/hosts. nss_wrapper provides an LD_PRELOAD way to modify passwd and hosts.
# when using centos as the base image, install epel-release
RUN dnf clean all && dnf install -y tar java nss_wrapper numpy && dnf clean all && cd /opt && curl $DISTRO_LOC | tar -zx && ln -s $DISTRO_NAME spark

# Add scripts used to configure the image
COPY resources /tmp/resources

# Custom scripts
RUN [ "sh", "-x", "/tmp/resources/spark/install" ]

# Cleanup the scripts directory
RUN rm -rf /tmp/resources

# Switch to the user 185 for OpenShift usage
USER 185

# Make the default PWD somewhere that the user can write. This is useful when connecting with 'oc run' and starting a 'spark-shell', which will likely try to create files and directories in PWD and error out if it cannot.
WORKDIR /tmp

ENTRYPOINT ["/entrypoint.sh"]

# Start the main process
CMD ["/opt/spark/bin/launch.sh"]