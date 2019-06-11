#!/bin/bash
#Hovig Ohannessian
set -e

GOROOT=$HOME/go/src/github.com/hyperledger

export FAB3_CONFIG=$GOROOT/fabric-chaincode-evm/examples/first-network-sdk-config.yaml
export FAB3_USER=User1
export FAB3_ORG=Org1
export FAB3_CHANNEL=mychannel
export FAB3_CCID=evmcc
export FAB3_PORT=5000


# build & start
cd $GOROOT/fabric-chaincode-evm
make fab3
bin/fab3
