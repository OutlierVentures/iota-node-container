#!/bin/bash

source ./set-env.sh

export NODE_CONTAINER_NAME=iota_node_${IOTA_CONTAINER_ENV}

docker exec -ti $NODE_CONTAINER_NAME bash
