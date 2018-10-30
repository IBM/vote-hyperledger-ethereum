## What exactly is happening under the hood

__List of file execution:__
* Removing existing containers
* Cloning `fabric-samples` 'origin/release-1.3'
* Cloning `web3-fabric-voting-dapp`
* Installing Hyperledger Fabric binaries
* Installing Hyperledger Fabric docker images  
* Pulling fabric Images:<br>
    hyperledger/fabric-peer<br>
    hyperledger/fabric-orderer<br>
    hyperledger/fabric-ccenv<br>
    hyperledger/fabric-tools<br>
    hyperledger/fabric-ca<br>
    hyperledger/fabric-couchdb<br>
    hyperledger/fabric-kafka<br>
    hyperledger/fabric-zookeeper
* Cloning `fabric-chaincode-evm`
* Starting channel 'mychannel'
* Generate certificates using cryptogen tool
* Generating Orderer Genesis block
* Generating channel configuration transaction 'channel.tx'
* Generating anchor peer update for Org1MSP   
* Generating anchor peer update for Org2MSP   
* Build your first network (BYFN) end-to-end test
* Channel 'mychannel' created
* peer0.org1 joined channel 'mychannel'
* peer1.org1 joined channel 'mychannel'
* peer0.org2 joined channel 'mychannel'
* peer1.org2 joined channel 'mychannel'
* Anchor peers updated for org 'Org1MSP' on channel 'mychannel'
* Anchor peers updated for org 'Org2MSP' on channel 'mychannel'
* Chaincode is installed on peer0.org1
* Chaincode is installed on peer0.org2
* Chaincode is instantiated on peer0.org2 on channel 'mychannel'
* Querying successful on peer0.org1 on channel 'mychannel'
* Invoking transaction successful on peer0.org1 peer0.org2 on channel 'mychannel'
* Chaincode is installed on peer1.org2
* Querying successful on peer1.org2 on channel 'mychannel'
* BYFN execution completed
* Starting Fab Proxy on port 5000
* DApp listening on port 3000!
