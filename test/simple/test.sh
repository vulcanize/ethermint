#! /bin/bash

removeQuotes() {
	a=$1
	a="${a%\"}" 
	a="${a#\"}"
	echo $a
}

cd $GOPATH/src/github.com/tendermint/ethermint/

ROOT=data

# initialzie data dir
cp -r test/data $ROOT
ethermint --datadir $ROOT init test/data/genesis.json

# start ethermint
ethermint --datadir $ROOT &> ethermint.log &

sleep 2

# get the state hash
STATE=`geth --exec "web3.eth.getBlock(0).stateRoot" attach ipc:$ROOT/geth.ipc`
STATE=`removeQuotes $STATE`
STATE=${STATE:2} # drop the leading 0x
echo $STATE

# run the eth test script
geth --exec 'loadScript("test/data/geth/script1.js")' attach ipc:$ROOT/geth.ipc

sleep 2 # commit blocks TODO: sleep in script

RESULT=`geth --exec 'loadScript("test/data/geth/script2.js")' attach ipc:$ROOT/geth.ipc`
echo $RESULT

if [[ "$RESULT" != "1" ]]; then
	exit 1
fi
