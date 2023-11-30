#!/bin/bash

# Define the Docker image name and tag
IMAGE_NAME="reactprojusingsh"
IMAGE_TAG="latest"

# Define the Docker Compose file
DOCKER_COMPOSE_FILE="docker-compose.yml"

# Pull the latest image from the registry (optional)
docker pull "${IMAGE_NAME}:${IMAGE_TAG}"

# Deploy the application using Docker Compose
docker-compose -f "${DOCKER_COMPOSE_FILE}" up -d

# Check if the deployment was successful
if [ $? -eq 0 ]; then
  echo "Application deployed successfully."
else
  echo "Error: Application deployment failed."
fi

