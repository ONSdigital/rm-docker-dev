#!/bin/bash

if [ $# -eq 0 ]; then
  docker stop rmdockerdev_ons-postgres_1
  docker rm rmdockerdev_ons-postgres_1
  docker-compose up -d
  docker ps
elif [ "$1" == "case" ]; then
  docker exec rmdockerdev_ons-postgres_1 psql -U postgres -f /docker-entrypoint-initdb.d/case_groundzero.sql
elif [ "$1" = "action" ]; then
  docker exec rmdockerdev_ons-postgres_1 psql -U postgres -f /docker-entrypoint-initdb.d/action_groundzero.sql
elif [ "$1" = "actionexp" ]; then
  docker exec rmdockerdev_ons-postgres_1 psql -U postgres -f /docker-entrypoint-initdb.d/actionexp_groundzero.sql
elif [ "$1" = "iac" ]; then
  docker exec rmdockerdev_ons-postgres_1 psql -U postgres -f /docker-entrypoint-initdb.d/iac_groundzero.sql
else
  echo "Invalid argument."
fi
