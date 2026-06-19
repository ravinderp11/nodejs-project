#!/bin/bash

set -e

REGION="us-east-1"
ACCOUNT="496097747127"
REPO="nodejs-app"

echo "Login to ECR"

aws ecr get-login-password \
--region $REGION | \
docker login \
--username AWS \
--password-stdin \
$ACCOUNT.dkr.ecr.$REGION.amazonaws.com

echo "Build Docker"

cd app

docker build -t node-app .

echo "Tag Docker"

docker tag node-app:latest \
$ACCOUNT.dkr.ecr.$REGION.amazonaws.com/$REPO:latest

echo "Push Docker"

docker push \
$ACCOUNT.dkr.ecr.$REGION.amazonaws.com/$REPO:latest