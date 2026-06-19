#!/bin/bash

set -e

AWS_REGION="us-east-1"
ECR_URL="496097747127.dkr.ecr.us-east-1.amazonaws.com/nodejs-app"

echo "Login to ECR"

aws ecr get-login-password \
--region $AWS_REGION | \
docker login \
--username AWS \
--password-stdin \
496097747127.dkr.ecr.us-east-1.amazonaws.com

echo "Build Docker"

docker build -t node-app ./app

echo "Tag Docker"

docker tag node-app:latest $ECR_URL:latest

echo "Push Docker"

docker push $ECR_URL:latest