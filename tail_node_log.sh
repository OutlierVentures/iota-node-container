#!/bin/sh

docker logs -f iota_node_mainnet | \
	perl -pe 's/SOLID SUBTANGLE milestone/\e[1;32;40m$&\e[0m/g' | \
	perl -pe 's/Latest milestone/\e[1;34;40m$&\e[0m/g'

