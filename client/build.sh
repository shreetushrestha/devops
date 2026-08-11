#!/bin/bash
set -euo pipefail

USERNAME="shreetushrestha"
IMAGE="mern-client"
TAG="v1"

FULL_NAME="$USERNAME/$IMAGE:$TAG"

echo "Building $FULL_NAME ..."

docker buildx build \
  --platform linux/amd64 \
  -t "$FULL_NAME" \
  --push .

echo "Done. Image is live on Docker Hub."
