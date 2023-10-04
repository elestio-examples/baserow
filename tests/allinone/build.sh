#!/usr/bin/env bash
cp deploy/all-in-one/* ./
rm -f docker-compose.yml
mv docker-compose-new.yml docker-compose.yml

docker buildx build . --output type=docker,name=elestio4test/baserow-allinone:latest | docker load
