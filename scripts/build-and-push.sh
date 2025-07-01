#!/bin/bash

set -e

ECR_REPO="${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/swaggerdemo123"
TAG_NAME="${GITHUB_REF#refs/tags/}"

echo "Modified services: $MODIFIED_SERVICES"

for SERVICE in $MODIFIED_SERVICES; do
  case $SERVICE in
    v-auth)
      docker buildx build \
        --platform linux/amd64 \
        -t $ECR_REPO:authserver-$TAG_NAME \
        -t $ECR_REPO:authserver-latest \
        -f ./src/SwaggerDemo.AuthServer/Dockerfile . \
        --push
      ;;
    v-dbmigrator)
      docker buildx build \
        --platform linux/amd64 \
        -t $ECR_REPO:dbmigrator-$TAG_NAME \
        -t $ECR_REPO:dbmigrator-latest \
        -f ./src/SwaggerDemo.DbMigrator/Dockerfile . \
        --push
      ;;
    v-http)
      docker buildx build \
        --platform linux/amd64 \
        -t $ECR_REPO:httpapi-$TAG_NAME \
        -t $ECR_REPO:httpapi-latest \
        -f ./src/SwaggerDemo.HttpApi.Host/Dockerfile . \
        --push
      ;;
  esac
done