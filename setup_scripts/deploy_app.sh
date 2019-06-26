#!/bin/bash
########################################
# Put this on a Server
# run chmod +x deploy_app.sh to make the script executable
#
# Execute this script:  ./deploy_app.sh bschwab/myapp:$TAG
# Replace the $TAG with the actual Build Tag you want to deploy
#
########################################

set -e

DOCKER_IMAGE=$1
CONAINER_NAME="myapp"

# Check for arguments
if [[ $# -lt 1 ]] ; then
    echo '[ERROR] You must supply a Docker Image to pull'
    exit 1
fi

echo "Deploying to Docker Container"

#Check for running container & stop it before starting a new one
if [ $(docker inspect -f '{{.State.Running}}' $CONAINER_NAME) = "true" ]; then
    docker stop myapp
fi

echo "Starting Docker Image name: $DOCKER_IMAGE"

# for private repos
echo $DOCKER_PWD | docker login -u $DOCKER_LOGIN --password-stdin

docker run -d --rm=true -p 80:6000 --name $CONAINER_NAME $DOCKER_IMAGE

docker ps -l
