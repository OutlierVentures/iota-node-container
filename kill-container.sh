#!/bin/bash

source vars.sh

docker stop $CONTAINER_NAME
docker rm $CONTAINER_NAME

