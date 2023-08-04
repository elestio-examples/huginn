#!/usr/bin/env bash
cp -r docker/single-process/* ./

docker buildx build . --output type=docker,name=elestio4test/huginn:latest | docker load
