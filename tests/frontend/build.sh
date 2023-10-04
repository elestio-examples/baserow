#!/usr/bin/env bash
cp web-frontend/* ./
rm -f docker-compose.yml
mv docker-compose-new.yml docker-compose.yml

docker buildx build . --output type=docker,name=elestio4test/baserow-frontend:latest | docker load
