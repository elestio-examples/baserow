#!/usr/bin/env bash
cd backend
docker buildx build . --output type=docker,name=baserow_backend:latest | docker load
cd ../web-frontend
docker buildx build . --output type=docker,name=baserow_web-frontend:latest | docker load
cd ../
cp deploy/all-in-one/* ./
rm -f docker-compose.yml
mv docker-compose-new.yml docker-compose.yml
docker buildx build . --output type=docker,name=elestio4test/baserow:latest | docker load
