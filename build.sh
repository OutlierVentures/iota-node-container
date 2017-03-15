#!/bin/bash

source vars.sh

cp ~/.ssh/id_rsa_devcontainers .

docker build -t $IMAGE_NAME .

rm ./id_rsa_devcontainers
