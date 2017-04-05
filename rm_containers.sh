#!/bin/bash

docker stop rmdockerdev_ons-postgres_1
docker rm rmdockerdev_ons-postgres_1
docker stop rmdockerdev_redis_1
docker rm rmdockerdev_redis_1
docker stop rmdockerdev_rabbitmq_1
docker rm rmdockerdev_rabbitmq_1
docker rmi rmdockerdev_ons-postgres
docker ps
