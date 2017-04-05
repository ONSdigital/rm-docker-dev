#!/bin/bash

docker stop docker_ons-postgres_1
docker rm docker_ons-postgres_1
docker stop docker_redis_1
docker rm docker_redis_1
docker stop docker_rabbitmq_1
docker rm docker_rabbitmq_1
docker rmi docker_ons-postgres
docker ps
