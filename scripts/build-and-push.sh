#!/bin/bash

set -e

ECR_REPO="${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/swaggerdemo123"
TAG_NAME="${GITHUB_REF#refs/tags/}"

# Affiche les services modifiés
echo "Modified services: $MODIFIED_SERVICES"

for SERVICE in $MODIFIED_SERVICES; do
  case $SERVICE in
    v-auth)
      docker build -t authserver -f ./src/SwaggerDemo.AuthServer/Dockerfile .
      docker tag authserver $ECR_REPO:authserver-$TAG_NAME
      docker tag authserver $ECR_REPO:authserver-latest
      docker push $ECR_REPO:authserver-$TAG_NAME
      docker push $ECR_REPO:authserver-latest
      ;;
    v-dbmigrator)
      docker build -t dbmigrator -f ./src/SwaggerDemo.DbMigrator/Dockerfile .
      docker tag dbmigrator $ECR_REPO:dbmigrator-$TAG_NAME
      docker tag dbmigrator $ECR_REPO:dbmigrator-latest
      docker push $ECR_REPO:dbmigrator-$TAG_NAME
      docker push $ECR_REPO:dbmigrator-latest
      ;;
    v-http)
      docker build -t httpapi -f ./src/SwaggerDemo.HttpApi.Host/Dockerfile .
      docker tag httpapi $ECR_REPO:httpapi-$TAG_NAME
      docker tag httpapi $ECR_REPO:httpapi-latest
      docker push $ECR_REPO:httpapi-$TAG_NAME
      docker push $ECR_REPO:httpapi-latest
      ;;
  esac
done
