#!/bin/bash
#Hovig Ohannessian
set -e

# Cleanup any existing local docker images, volumes & containers
echo "Removing existing containers"
docker stop $(docker ps -q) || true
#docker rm $(docker ps -aq)
#docker rmi $(docker images -q) -f

# export path to go folder
export GOPATH=$HOME/go
GOROOT=$GOPATH/src/github.com/hyperledger
DIR_FABRIC="fabric-samples"
DIR_APP="web3-voting-dapp"
DIR_CHAINCODE_EVM="fabric-chaincode-evm"

if [ -d $GOROOT ]; then
  echo "$GOROOT directory exists"
else
  #create new folder
  sudo mkdir -p $GOROOT
  chmod +x $GOROOT
fi
git clone https://github.com/hovig/web3-fabric-voting-dapp.git || true
cd $GOROOT
echo "$GOROOT"

if [ ! -d "$DIR_FABRIC" ]; then
  # clone fabric samples version 1.3
  git clone https://github.com/hyperledger/fabric-samples.git 
fi
echo "fabric-samples exists"

#if [ ! -d "$DIR_APP" ]; then
  # clone the voting repo
#git clone https://github.com/hovig/web3-fabric-voting-dapp.git || true
#fi
echo "web3-fabric-voting-dapp exists"
chmod 777 fabric-samples
cd fabric-samples
git checkout release-1.3

# install/run the latest docker images for Hyperledger Fabric
./scripts/bootstrap.sh
cd $GOROOT
if [ ! -d "$DIR_CHAINCODE_EVM" ]; then
  # clone fabric chaincode evm
  git clone https://github.com/hyperledger/fabric-chaincode-evm.git
fi
chmod 777 fabric-chaincode-evm
echo "fabric-chaincode-evm exists"
cd $GOROOT/fabric-samples/first-network
rm -rf docker-compose-cli.yaml

# copy this modified yaml file that includes chaincode evm volume
cp $GOROOT/web3-fabric-voting-dapp/scripts/docker-compose-cli.yaml .

# fabric network execution
./byfn.sh -m down
./byfn.sh -m up
docker exec -it cli bash
