# Install docker on macOS follow the following link:

    https://docs.docker.com/docker-for-mac/install/


# login to docker

    docker login

# YOU ONLY NEED THE TWO docker-compose-...yml FILES

# Create a directory called rmdockerdev and place the files in here

# in rmdockerdev run

    docker-compose -f docker-compose-dev_env.yml up -d              //for dev environment
    docker-compose -f docker-compose-services.yml up -d             //for all services (Requires previous compose first)

# Ground Zero -- Requires groundzero.sh file from github

    ./groundzero.sh [SERVICE]

Where service can be:

    - case
    - action
    - actionexp
    - iac
    - sample
or blank to delete and remake the whole database.

Alternativley you can run the groundzero.sql scripts in pgAdmin.

# View running containers

    docker ps

# View All Containers

    docker ps -a

# Access containers

    docker exec -it [CONTAINER_NAME] [COMMAND]

Examples
To access the redis-cli:

    docker exec -it rmdockerdev_redis_1 redis-cli

To access postgres

    docker exec -it rmdockerdev_ons-postgres_1 psql -U postgres -d postgres

To access the containers

    docker exec -it case bash

To run a single command

    docker exec rmdockerdev_redis_1 redis-cli del MetaData

will delete the redis MetaDataStore

# To rebuild all containers run

    docker-compose stop && docker-compose rm && docker-compose up -d


# Delete ALL Containers

    docker-compose stop && docker-compose rm

# Delete Specific Container

    docker stop <CONTAINER_NAME>
    docker rm <CONTAINER_NAME>

# To create a specific container

RabbitMQ

    docker run -d --hostname rabbit --name rmdockerdev_rabbitmq_1 -p 4369:4369 -p 25672:25672 -p 5671-5672:5671-5672 -p 15671-15672:15671-15672 rabbitmq:3.6-management

Postgres

    docker run --name rmdockerdev_ons-postgres_1  -d -p 5432:5432 ons_postgres
    docker start rmdockerdev_ons-postgres_1

redis

    docker run --name rmdockerdev_redis_1  -d redis
