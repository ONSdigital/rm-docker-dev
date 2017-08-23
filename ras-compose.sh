#!/bin/bash

###
# Creates ras-party and ras-collection-instrument containers and populates the database with test data for them
###

docker-compose -f docker-compose-ras.yml up -d
sleep 15 
docker exec postgres psql -U postgres -d postgres -f party_test_data.sql
docker exec postgres psql -U postgres -d postgres -f collection_instrument_test_data.sql
