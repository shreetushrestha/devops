#!/bin/bash
set -euo pipefail

HOST="54.164.17.14"
USER="ec2-user"
KEY="/Users/shreetu/Downloads/docker key.pem"

USERNAME="shreetushrestha"
IMAGE="mern-server"
TAG="v1"

FULL_NAME="$USERNAME/$IMAGE:$TAG"

echo "Deploying $FULL_NAME to $USER@$HOST ..."

ssh -i "$KEY" "$USER@$HOST" << EOF
docker pull $FULL_NAME

docker stop mern-server || true
docker rm mern-server || true

docker run -d \
  --name mern-server \
  --restart unless-stopped \
  -p 5000:5000 \
  $FULL_NAME
EOF

echo "Backend deployed successfully."
