#!/bin/bash

aws ecr get-login-password \
--region us-east-1 \
| docker login \
--username AWS \
--password-stdin \
YOUR_ECR_URL


docker build \
-t node-app \
-f app/Dockerfile \
app


docker tag \
node-app:latest \
YOUR_ECR_URL:latest


docker push \
YOUR_ECR_URL:latest