#!/bin/bash

# Configuration

DOCKER_IMAGE_NAME=java-openjdk
DOCKER_IMAGE_TAG=latest

DOCKER_IMAGE_NAME_FULLY_QUALIFIED=${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}


echo "Local build of ${DOCKER_IMAGE_NAME} container"

echo "	--> copying dependencies into local docker context"
echo "		--> Currently, nothing to do here"
echo "	--> executing docker build"
docker build -t ${DOCKER_IMAGE_NAME_FULLY_QUALIFIED} dockercontext

echo "	--> to run this container: docker run -it ${DOCKER_IMAGE_NAME_FULLY_QUALIFIED} /bin/bash" 
echo "Done."