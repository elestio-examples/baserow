#!/usr/bin/env bash
cp deploy/all-in-one/* ./
docker buildx build . --output type=docker,name=elestio4test/baserow:latest | docker load
