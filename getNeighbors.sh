#!/bin/bash

source ./set-env.sh

curl http://${IOTA_NODE_IP}:${IOTA_API_PORT} -X POST -H 'Content-Type: application/json' -d '{"command": "getNeighbors"}'
