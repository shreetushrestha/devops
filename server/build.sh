#!/bin/bash
set -euo pipefail
# --- settings (change USERNAME to your Docker Hub username) ---
USERNAME="shreetushrestha"
IMAGE="mern-server"
TAG="v1"
FULL_NAME="$USERNAME/$IMAGE:$TAG"
# --- 1. build the image from the Dockerfile here ---
echo "Building $FULL_NAME ..."
docker build -t "$FULL_NAME" .
# --- 2. push it to Docker Hub ---
echo "Pushing $FULL_NAME ..."
docker push "$FULL_NAME"
echo "Done. Image is live on Docker Hub."
