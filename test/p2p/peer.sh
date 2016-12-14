#! /bin/bash
set -eu

DOCKER_IMAGE=$1
NETWORK_NAME=$2
ID=$3

set +u
SEEDS=$4
set -u
if [[ "$SEEDS" != "" ]]; then
	SEEDS=" --seeds $SEEDS "
fi

ROOT=/go/src/github.com/tendermint/ethermint

echo "starting tendermint peer ID=$ID"
# start ethermint container on the network
docker run -d \
	--net=$NETWORK_NAME \
	--ip=$(test/p2p/ip.sh $ID) \
	--name local_testnet_$ID \
	--entrypoint /bin/bash \
	-e TMROOT=$ROOT/test/p2p/data/mach$ID \
	-e ETH_GENESIS=$ROOT/test/p2p/data/ethereum/genesis.json \
	-e SEEDS="$SEEDS" \
	$DOCKER_IMAGE $ROOT/test/p2p/run.sh
