#!/bin/bash

# Define the Docker image name and tag
IMAGE_NAME="reactprojusingsh"
IMAGE_TAG="latest"

# Build the Docker image
docker build -t "${IMAGE_NAME}:${IMAGE_TAG}" .

# Check if the build was successful
if [ $? -eq 0 ]; then
  echo "Docker image '${IMAGE_NAME}:${IMAGE_TAG}' built successfully."
else
  echo "Error: Docker image build failed."
fi

