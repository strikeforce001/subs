# subs
## Check nodes from RPC request
This code works as follows:

##  1.	Node connection: The code connects to a Kusama (or Polkadot) node using WebSocket.
## 	2.	Fetching block information: In each loop, the code retrieves the latest block header (block number and hash).
## 	3.	Sync status check: The code checks whether the node is syncing and displays information about the current and highest block.
## 	4.	Health check: The code retrieves information about the number of peers and the sync status to determine if the node is healthy.
## 	5.	Monitoring loop: The program repeats the requests every 10 seconds to continuously monitor the node’s state.
