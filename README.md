# Install docker on macOS follow the following link:

    https://docs.docker.com/docker-for-mac/install/

# login to docker

    docker login

# in rmdockerdev run
    
    docker-compose -f docker-compose-dev_env.yml pull 
    docker-compose -f docker-compose-dev_env.yml up -d              //for dev environment

    docker-compose -f docker-compose-services.yml pull
    docker-compose -f docker-compose-services.yml up -d             //for all services (Requires previous compose first)

    docker-compose -f docker-compose-services.yml up -d [SERVICE]   //for only specific containers rather than all of them

# Changing variables

You can change the host and port values of services in the .env file

    Host must be either a container name, your IP or the service cloudfoundry path
    
# Ground Zero -- Requires groundzero.sh file from github

    ./groundzero.sh [SERVICE] [SERVICE] ...

Where service can be any number of:

    - case
    - action
    - actionexp
    - iac
    - sample
    - collex

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

    docker exec -it redis redis-cli

To access postgres

    docker exec -it postgres psql -U postgres -d postgres

To access the containers

    docker exec -it case bash

To run a single command

    docker exec redis redis-cli del MetaData

will delete the redis MetaDataStore

# To start all stopped containers

    docker start $(docker ps -a -q)

# To stop all containers

    docker stop $(docker ps -q)

OR

    docker-compose -f docker-compose-services.yml down

# To Delete All images (when no containers exist)

    docker rmi $(docker images -q)

# Delete ALL Containers

    docker rm $(docker ps -a -q)

# Delete Specific Container

    docker stop <CONTAINER_NAME>
    docker rm <CONTAINER_NAME>

