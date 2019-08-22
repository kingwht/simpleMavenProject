#!/bin/bash

# Copy the new jar to the build location
cp -f target/*.jar jenkins/build/

echo "****************************"
echo "** Building Docker Image ***"
echo "****************************"

TAG="${env.BUILD_ID}"
echo $TAG

cd jenkins/build && docker build -f Dockerfile-Java -t maven-project:"${env.BUILD_ID}" --no-cache .
