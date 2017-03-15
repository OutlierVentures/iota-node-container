#!/bin/bash

source vars.sh

docker stop $CONTAINER_NAME
docker rm $CONTAINER_NAME

docker stop $MONGO_BIGCHAINDB_CONTAINER_NAME
docker rm $MONGO_BIGCHAINDB_CONTAINER_NAME
