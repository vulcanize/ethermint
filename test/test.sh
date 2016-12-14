#! /bin/bash
set -eu

# Top Level Testing Script

echo ""
echo "* building docker image"
bash ./test/docker/build.sh

# test basic network connectivity
# by starting a local testnet and checking peers connect and make blocks
echo ""
echo "* running p2p tests on a local docker network"
bash test/p2p/test.sh ethermint
