#!/bin/bash

if [ $# -eq 0 ]; then
  docker stop docker_ons-postgres_1
  docker rm docker_ons-postgres_1
  docker-compose up -d
  #docker run --name docker_ons-postgres_1 -d -p 5432:5432 docker_ons-postgres
  #docker start docker_ons-postgres_1
  docker ps
elif [ "$1" == "case" ]; then
  docker exec docker_ons-postgres_1 psql -U postgres -f /docker-entrypoint-initdb.d/case_groundzero.sql
elif [ "$1" = "action" ]; then
  docker exec docker_ons-postgres_1 psql -U postgres -f /docker-entrypoint-initdb.d/action_groundzero.sql
elif [ "$1" = "actionexp" ]; then
  docker exec docker_ons-postgres_1 psql -U postgres -f /docker-entrypoint-initdb.d/actionexp_groundzero.sql
elif [ "$1" = "iac" ]; then
  docker exec docker_ons-postgres_1 psql -U postgres -f /docker-entrypoint-initdb.d/iac_groundzero.sql
else
  echo "Invalid argument."
fi
