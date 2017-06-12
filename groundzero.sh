#!/bin/bash

if [ $# -eq 0 ]; then
  docker stop postgres
  docker rm postgres
  docker run --name postgres -d -p 5432:5432 --network rmdockerdev_default sdcplatform/postgres
  docker ps
elif [ "$1" == "case" ]; then
  docker exec postgres psql -U postgres -f /docker-entrypoint-initdb.d/case_groundzero.sql
elif [ "$1" = "action" ]; then
  docker exec postgres psql -U postgres -f /docker-entrypoint-initdb.d/action_groundzero.sql
elif [ "$1" = "actionexp" ]; then
  docker exec postgres psql -U postgres -f /docker-entrypoint-initdb.d/actionexp_groundzero.sql
elif [ "$1" = "iac" ]; then
  docker exec postgres psql -U postgres -f /docker-entrypoint-initdb.d/iac_groundzero.sql
elif [ "$1" = "sample" ]; then
  docker exec postgres psql -U postgres -f /docker-entrypoint-initdb.d/sample_groundzero.sql
elif [ "$1" = "collex" ]; then
  docker exec postgres psql -U postgres -f /docker-entrypoint-initdb.d/collex_groundzero.sql
else
  echo "Invalid argument."
fi
