#!/bin/bash

# Copy the new jar to the build location
cp -f target/*.jar jenkins/build/

echo "****************************"
echo "** Building Docker Image ***"
echo "****************************"

WORKSPACE=/home/ec2-user/jenkins-data/jenkins_home/workspace/simple-maven-project

docker build -f Dockerfile-Java -t maven-project:env.BUILD_ID --no-cache $WORKSPACE/jenkins/build
