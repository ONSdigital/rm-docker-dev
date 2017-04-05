# Install docker on macOS follow the following link:

    https://docs.docker.com/docker-for-mac/install/

# ***** Run the following commands in the /docker directory *****
# First Time Setup

Copy the IAC groundzero.sql into docker/postgres/iac_groundzero.sql

Then run:
  
    ./initialize.sh  -f

This script installs docker-compose, then builds an instance of redis, rabbitmq and postgres as well as running the postgres groundzero scripts to initialize.

# To rebuild all containers run 

    ./initialize.sh

# To remove all containers first and then rebuild run 

    ./initialize.sh -r

# Ground Zero

    ./groundzero.sh [SERVICE]

Where service can be:

    - case
    - action
    - actionexp
    - iac
or blank to delete and remake the whole database.

Alternativley you can run the groundzero.sql scripts in pgAdmin.

# Delete All Containers 

    ./rm_containers.sh

This script removes all docker containers created by the above two scripts.

# ***** General Docker Commands *****

# View running containers

    docker ps

# View All Containers

    docker ps -a

# Delete Container

    docker stop <CONTAINER_NAME>
    docker rm <CONTAINER_NAME>
