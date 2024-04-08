#!/usr/bin/env bash
docker-compose up -d;

docker-compose down;
docker pull elestio/postgres:15
docker-compose up -d;

sleep 300s;
