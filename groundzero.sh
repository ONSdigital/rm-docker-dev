#!/bin/bash

if [ $# -eq 0 ]; then
  docker stop postgres
  docker rm postgres
  docker run --name postgres -d -p 6432:5432 --network rmdockerdev_default sdcplatform/postgres
  docker ps
else
  for arg in "$@"
  do
    if [ "$arg" == "case" ]; then
      docker exec postgres psql -U postgres -f /docker-entrypoint-initdb.d/case_groundzero.sql
    elif [ "$arg" = "action" ]; then
      docker exec postgres psql -U postgres -f /docker-entrypoint-initdb.d/action_groundzero.sql
    elif [ "$arg" = "actionexp" ]; then
      docker exec postgres psql -U postgres -f /docker-entrypoint-initdb.d/actionexp_groundzero.sql
    elif [ "$arg" = "iac" ]; then
      docker exec postgres psql -U postgres -f /docker-entrypoint-initdb.d/iac_groundzero.sql
    elif [ "$arg" = "sample" ]; then
      docker exec postgres psql -U postgres -f /docker-entrypoint-initdb.d/sample_groundzero.sql
    elif [ "$arg" = "collex" ]; then
      docker exec postgres psql -U postgres -f /docker-entrypoint-initdb.d/collex_groundzero.sql
    elif [ "$arg" = "notify" ]; then
      docker exec postgres psql -U postgres -f /docker-entrypoint-initdb.d/notify_groundzero.sql
    else
      echo "Invalid argument."
    fi
  done
fi
