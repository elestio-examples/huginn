#!/usr/bin/env bash
rm -f docker/single-process/README.md
cp -r docker/single-process/* ./
rm -f docker-compose.yml
mv docker-compose-new.yml docker-compose.yml
docker buildx build . --output type=docker,name=elestio4test/huginn:latest | docker load
