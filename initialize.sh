#!/bin/bash
if [ "$1" == "-f" ]; then 
  curl -L https://github.com/docker/compose/releases/download/1.12.0-rc2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
fi
if [ "$1" == "-r" ]; then
  ./rm_containers.sh
fi
docker-compose up -d
docker ps


