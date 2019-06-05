#!/bin/bash
#Hovig Ohannessian
set -e

GOROOT=$HOME/go/src/github.com/hyperledger

# export fabric proxy settings
export FABPROXY_CONFIG=$GOROOT/fabric-chaincode-evm/examples/first-network-sdk-config.yaml
export FABPROXY_USER=User1
export FABPROXY_ORG=Org1
export FABPROXY_CHANNEL=mychannel
export FABPROXY_CCID=evmcc
export PORT=5000

# build & start 
cd $GOROOT/fabric-chaincode-evm
go build -o fab3 ./fabproxy/cmd
./fab3
