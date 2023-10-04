#!/usr/bin/env bash
cp deploy/all-in-one/* ./
rm -f docker-compose.yml
mv docker-compose-new.yml docker-compose.yml
sed -i "s~ARG FROM_WEBFRONTEND_IMAGE=baserow_web-frontend~ARG FROM_WEBFRONTEND_IMAGE=elestio4test/baserow-frontend:latest~g" ./Dockerfile
sed -i "s~ARG FROM_BACKEND_IMAGE=baserow_backend~ARG FROM_BACKEND_IMAGE=elestio4test/baserow-backend:latest~g" ./Dockerfile
docker buildx build . --output type=docker,name=elestio4test/baserow-allinone:latest | docker load
