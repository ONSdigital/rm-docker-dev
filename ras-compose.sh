#!/bin/bash

# stop all running containers
down() {
 docker-compose -f docker-compose-ras.yml down
 docker-compose -f docker-compose-dev_env.yml down
}

pull() {
docker-compose -f docker-compose-dev_env.yml pull
docker-compose -f docker-compose-ras.yml pull
}

up() {
docker-compose -f docker-compose-dev_env.yml up -d
docker-compose -f docker-compose-ras.yml up -d
}

usage() {
echo "Script to run up required containers for RAS, use flags:- clean: pull containers and run, up rebuild and restart all containers"
}

populate() {
sleep 10
docker exec postgres psql -U postgres -d postgres -f collection_instrument_test_data.sql
}
case "$1" in
 up) 
    down
    up
    populate
    ;;
 clean)
   down 
   pull
   up
   populate
   ;;
 *)
   usage
   ;;
esac
