#!/usr/bin/env bash
set -Eeu

readonly MY_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

exists=$(docker buildx ls | grep container-builder | wc -l)

if [ $exists -eq 0 ]; then
    docker buildx create \
        --name container-builder \
        --driver docker-container \
        --bootstrap --use
fi

docker build \
    --builder container-builder \
    --platform linux/amd64,linux/arm64 \
    --compress \
    --file "${MY_DIR}/Dockerfile" \
    --tag "cyber-dojo-languages/csharp" \
    --provenance=false \
    "${MY_DIR}"

docker build \
    --builder container-builder \
    --load \
    --platform linux/amd64 \
    --tag "cyber-dojo-languages/csharp" \
    "${MY_DIR}"

