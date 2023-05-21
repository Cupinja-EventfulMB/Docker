#!/bin/bash

env_file="./.env"
DOCKER_USERNAME=$(grep "DOCKER_USERNAME" "$env_file" | cut -d '=' -f2)
DOCKER_PASSWORD=$(grep "DOCKER_PASSWORD" "$env_file" | cut -d '=' -f2)

docker stop docker_app_1

docker rm docker_app_1

# Log in to Docker Hub
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
echo "Logged in"

# Docker pull
docker pull cvetankapasinechka/cupinja:project

# Start the updated container
docker-compose up -d

# Print the container status
docker-compose ps