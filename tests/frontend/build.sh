#!/usr/bin/env bash
cp web-frontend/* ./
rm -f docker-compose.yml
mv docker-compose-new.yml docker-compose.yml
sed -i "s~&&RUN yarn install && yarn cache clean~&& RUN yarn install --network-timeout 100000 && yarn cache clean~g" Dockerfile
docker buildx build . --output type=docker,name=elestio4test/baserow-frontend:latest | docker load
