#!/bin/bash

source ./set-env.sh

export NODE_CONTAINER_NAME=iota_app_${IOTA_COMPOSE_ENV}

docker exec -ti $NODE_CONTAINER_NAME bash
