#!/bin/bash
set -e

# stop all running containers
down() {
 docker-compose -f docker-compose-services.yml down
 docker-compose -f docker-compose-ras.yml down
 docker-compose -f docker-compose-dev_env.yml down
}

pull() {
 docker-compose -f docker-compose-dev_env.yml pull
 docker-compose -f docker-compose-ras.yml pull
 docker-compose -f docker-compose-services.yml pull
}

up() {
 docker-compose -f docker-compose-dev_env.yml up -d
 docker-compose -f docker-compose-ras.yml up -d
 docker-compose -f docker-compose-services.yml up -d
}

copy_data() {
  docker cp install_test_data.sql postgres:/install_test_data.sql
}

install_data() {
  docker exec postgres psql -U postgres -d postgres -f install_test_data.sql
}

usage() {
echo "Script to run up RM CONTAINERS, use flags:- clean: pull containers and run, up rebuild and restart all containers, down: stop all running containers, populate: populate database with test data"
}

case "$1" in
 up)
   down
   up
   copy_data
   ;;
 clean)
   down
   pull
   up
   copy_data
   ;;
 down)
   down
   ;;
 populate)
   install_data
   ;;
 *)
   usage
   ;;
esac
