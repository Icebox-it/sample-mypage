#!/bin/bash
# date format:YYYYMMDDHHMMSS
export PATH="/usr/local/bin:$PATH"
IMAGE_NAME="nginx-$(date +%Y%m%d%H%M%S)"
CONTAINER_NAME="sample-nginx00"

echo "Building Docker image: $IMAGE_NAME"
docker build -t "$IMAGE_NAME" .

echo "Stopping and removing old container if exists..."
docker stop "$CONTAINER_NAME" 2>/dev/null || true
docker rm "$CONTAINER_NAME" 2>/dev/null || true

echo "Running container: $CONTAINER_NAME"
docker run -d -p 8080:80 --name "$CONTAINER_NAME" "$IMAGE_NAME"

echo "Container started."
echo "Access Url: "http://localhost:8080""
echo "End"