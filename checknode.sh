#!/bin/bash
from substrateinterface import SubstrateInterface, Keypair
import time

# Connect to a Substrate node (Kusama or Polkadot)
substrate = SubstrateInterface(
    url="wss://kusama-rpc.polkadot.io",  # Replace with the URL of your node
    type_registry_preset='kusama'  # Use 'polkadot' for Polkadot networks
)

def monitor_node():
    while True:
        try:
            # Fetch the latest block header information
            block_info = substrate.get_block_header()

            # Fetch the sync status of the node
            sync_info = substrate.rpc_request("system_syncState", [])

            # Fetch the health status of the node
            health_info = substrate.rpc_request("system_health", [])

            # Output block information
            print(f"Block number: {block_info['number']}")
            print(f"Block hash: {block_info['hash']}")

            # Output sync information
            is_syncing = sync_info['result']['syncing']
            print(f"Node syncing: {is_syncing}")
            if is_syncing:
                print(f"Highest block: {sync_info['result']['highestBlock']}")
                print(f"Starting block: {sync_info['result']['startingBlock']}")
                print(f"Current block: {sync_info['result']['currentBlock']}")

            # Output health information
            print(f"Peers: {health_info['result']['peers']}")
            is_node_healthy = health_info['result']['isSyncing']
            print(f"Node healthy: {not is_node_healthy}")

            # Pause before the next check
            time.sleep(10)

        except Exception as e:
            # Handle any exceptions and output the error
            print(f"Error: {e}")
            time.sleep(10)

# Start monitoring the node
monitor_node()
