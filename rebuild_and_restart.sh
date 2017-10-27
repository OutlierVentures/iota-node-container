#!/bin/bash

make stop && \
    make build-node && \
    make start && \
    docker logs -f iota_node_mainnet