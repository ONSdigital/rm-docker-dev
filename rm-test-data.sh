#!/bin/bash

docker-compose -f docker-compose-ras.yml down
docker-compose -f docker-compose-ras.yml up -d
sleep 20
docker exec postgres psql -U postgres -d postgres -f collection_instrument_test_data.sql
