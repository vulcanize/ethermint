#! /bin/bash

cd $GOPATH/src/github.com/tendermint/ethermint

docker build -t ethermint -f ./test/docker/Dockerfile .
