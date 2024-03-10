#!/usr/bin/env bash

cp backend/Dockerfile ./Dockerfile
docker buildx build . --platform linux/arm64,linux/amd64 --tag elestio4test/baserow-backend:latest
docker buildx build . --platform linux/arm64,linux/amd64 --tag elestio4test/baserow-backend:latest --output type=docker | docker load

# docker buildx build . --platform linux/arm64,linux/amd64 --output type=docker,name=elestio4test/baserow-backend:latest | docker load

rm ./Dockerfile
cp -r web-frontend/Dockerfile ./Dockerfile
docker buildx build . --platform linux/arm64,linux/amd64 --tag elestio4test/baserow-frontend:latest
docker buildx build . --platform linux/arm64,linux/amd64 --tag elestio4test/baserow-frontend:latest --output type=docker | docker load
# docker buildx build . --platform linux/arm64,linux/amd64 --output type=docker,name=elestio4test/baserow-frontend:latest | docker load
rm ./Dockerfile

cp -r deploy/all-in-one/Dockerfile ./Dockerfile
rm -f docker-compose.yml
mv docker-compose-new.yml docker-compose.yml
rm -f README.md
mv README-new.md README.md
sed -i "s~ARG FROM_WEBFRONTEND_IMAGE=baserow_web-frontend~ARG FROM_WEBFRONTEND_IMAGE=elestio4test/baserow-frontend:latest~g" ./Dockerfile
sed -i "s~ARG FROM_BACKEND_IMAGE=baserow_backend~ARG FROM_BACKEND_IMAGE=elestio4test/baserow-backend:latest~g" ./Dockerfile
docker buildx build . --output type=docker,name=elestio4test/baserow-allinone:latest | docker load
