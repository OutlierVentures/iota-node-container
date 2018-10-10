#!/bin/sh

sudo rm -rf data/iri
mkdir data/iri
cd data/iri
curl http://db.iota.partners/iri-mainnetdb.tar.gz | tar xz

cd ../..
