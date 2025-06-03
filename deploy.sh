#!/usr/bin/env bash

# 1) Setting up the environment
echo 'Starting deployment...'
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 290792183577.dkr.ecr.us-east-1.amazonaws.com

# 2) Creating and uploading the image
docker build -t 290792183577.dkr.ecr.us-east-1.amazonaws.com/my-node-app:latest .
docker push 290792183577.dkr.ecr.us-east-1.amazonaws.com/my-node-app:latest

# 3) Cleanup
docker image rm 290792183577.dkr.ecr.us-east-1.amazonaws.com/my-node-app:latest