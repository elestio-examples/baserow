#!/usr/bin/env bash
cp web-frontend/* ./
rm -f docker-compose.yml
mv docker-compose-new.yml docker-compose.yml
sed -i "s~RUN yarn install~RUN yarn install --network-timeout 300000~g" Dockerfile
docker buildx build . --output type=docker,name=elestio4test/baserow-frontend:latest | docker load
