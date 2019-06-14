#!/bin/bash
set -euxv

cp "$PWD/requirements.txt" "$PWD/.docker/"
docker build -t sphinx "$PWD/.docker"
rm "$PWD/.docker/requirements.txt"
docker run \
    --rm \
    -v "$PWD":/data \
    sphinx
    