#!/bin/bash

# Exit on error
set -e

# AWS ECR repository details
ECR_REPO="xxxxxxxxxxxxxxxxxxxxx"
IMAGE_TAG="latest"

echo "🔨 Building Docker image..."
docker build --platform linux/amd64 -t pupeteer-example .

echo "🔑 Logging in to AWS ECR..."
aws ecr get-login-password --region eu-north-1 | docker login --username AWS --password-stdin $ECR_REPO

echo "🏷️  Tagging image..."
docker tag pupeteer-example:latest $ECR_REPO:$IMAGE_TAG

echo "⬆️  Pushing to ECR..."
docker push $ECR_REPO:$IMAGE_TAG

echo "✅ Done! Image successfully built and pushed to ECR." 

chmod +x build.sh 