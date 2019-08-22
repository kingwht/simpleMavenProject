#!/bin/bash

# Copy the new jar to the build location
cp -f target/*.jar jenkins/build/

echo "****************************"
echo "** Building Docker Image ***"
echo "****************************"
# grant excution permission
sudo chmod -R +x ./*

cd jenkins/build/ && docker-compose -f docker-compose-build.yml build --no-cache
