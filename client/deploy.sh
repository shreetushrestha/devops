#!/bin/bash
set -euo pipefail

HOST="54.164.17.14"
USER="ec2-user"
KEY="/Users/shreetu/Downloads/docker key.pem"

USERNAME="shreetushrestha"
IMAGE="mern-client"
TAG="v1"

FULL_NAME="$USERNAME/$IMAGE:$TAG"

echo "Deploying $FULL_NAME to $USER@$HOST ..."

ssh -i "$KEY" "$USER@$HOST" << EOF
docker pull $FULL_NAME

docker stop mern-client || true
docker rm mern-client || true

docker run -d \
  --name mern-client \
  --restart unless-stopped \
  -p 5173:5173 \
  $FULL_NAME
EOF

echo "Frontend deployed successfully."
