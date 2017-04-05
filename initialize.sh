#!/bin/bash
if [ "$1" == "-f" ]; then 
  curl -L https://github.com/docker/compose/releases/download/1.12.0-rc2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
fi
docker build -t postgres/ons_postgres postgres/.
docker-compose up -d
docker exec  docker_ons-postgres_1 psql -U postgres -f /docker-entrypoint-initdb.d/case_groundzero.sql
docker exec  docker_ons-postgres_1 psql -U postgres -f /docker-entrypoint-initdb.d/action_groundzero.sql
docker exec  docker_ons-postgres_1 psql -U postgres -f /docker-entrypoint-initdb.d/iac_groundzero.sql
docker ps
