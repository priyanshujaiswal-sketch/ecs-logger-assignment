#!/bin/bash

REGION="ap-south-1"
ACCOUNT_ID="014974080493"
REPO="priyanshu-ecs-logger"

echo "Login to ECR"
aws ecr get-login-password --region $REGION | \
docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com

echo "Build docker image"
docker build --platform linux/amd64 -t ecs-logger .

echo "Tag image"
docker tag ecs-logger:latest $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPO:latest

echo "Push image to ECR"
docker push $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPO:latest

echo "Done"
