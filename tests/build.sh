#!/usr/bin/env bash
cp -rf docker/single-process/* ./

docker buildx build . --output type=docker,name=elestio4test/huginn:latest | docker load
