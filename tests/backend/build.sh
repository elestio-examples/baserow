#!/usr/bin/env bash
cp backend/Dockerfile ./Dockerfile
rm -f docker-compose.yml
mv docker-compose-new.yml docker-compose.yml

docker buildx build . --output type=docker,name=elestio4test/baserow-backend:latest | docker load
