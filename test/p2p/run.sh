#! /bin/bash

echo "TMROOT" $TMROOT
echo "SEEDS" $SEEDS
echo "ETH GEN" $ETH_GENESIS

echo "BEFORE"
cat $TMROOT/genesis.json
ethermint --datadir $TMROOT init $ETH_GENESIS
echo "AFTER"
cat $TMROOT/genesis.json
ethermint --datadir $TMROOT $SEEDS --log_level=notice
