#!/usr/bin/env bash
cp -r web-frontend/* ./
rm -f docker-compose.yml
mv docker-compose-new.yml docker-compose.yml
rm -f README.md
mv README-new.md README.md
sed -i "s~RUN yarn install~RUN yarn install --network-timeout 300000~g" Dockerfile
sed -i "s~yarn install --production~yarn install --production --network-timeout 300000~g" Dockerfile
docker buildx build . --output type=docker,name=elestio4test/baserow-frontend:latest | docker load
