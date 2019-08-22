#!/bin/bash

echo "***************************"
echo "** Testing the code ***********"
echo "***************************"
WORKSPACE=~/jenkins-data/jenkins_home/workspace/simple-maven-project

docker run --rm -v $WORKSPACE:/app -v /root/.m2/:/root/.m2/ -w /app maven:3-alpine "$@"
