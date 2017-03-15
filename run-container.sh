#!/bin/bash

source vars.sh

BASEPATH=/home/aron/develop/public-data-works

docker run --name $CONTAINER_NAME --net develop --ip $CONTAINER_IP_ADDRESS -v $BASEPATH/home:/home/aron -v $BASEPATH/src:/develop -td $IMAGE_NAME
