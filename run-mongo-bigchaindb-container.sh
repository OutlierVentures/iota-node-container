#!/bin/bash

source vars.sh

BASEPATH=/home/aron/develop/public-data-works

docker run --name ${MONGO_BIGCHAINDB_CONTAINER_NAME} --net develop --ip $MONGO_BIGCHAINDB_CONTAINER_IP_ADDRESS -v $BASEPATH/data:/data/db -td mongo
