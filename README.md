# BasicDAO: A Simple Decentralized Autonomous Organization

This repository contains a simple DAO contract that allows members to create proposals, vote on them, and execute approved proposals. The contract is designed for educational purposes and can be deployed using Remix.

## Remix Default Workspace

The Remix default workspace is present when:
1. Remix loads for the first time.
2. A new workspace is created using the 'Default' template.
3. There are no files existing in the File Explorer.

This workspace contains three directories:

- **contracts/**: Contains Solidity smart contracts.
- **scripts/**: Contains deployment scripts using `web3.js` and `ethers.js`.
- **tests/**: Includes test scripts for verifying contract functionality.

## Understanding the DAO Contract

### Features:
- **Proposals**: Members suggest actions for the DAO.
- **Voting**: Each member gets one vote per proposal.
- **Execution**: If a proposal gets at least one vote, the owner executes it.
- **Membership**: The DAO owner can add new members but cannot influence votes.


## Deploying and Interacting with the DAO Contract on Remix

### Steps to Deploy:
1. Open [Remix IDE](https://remix.ethereum.org/).
2. Create a new Solidity file under `contracts/` (e.g., `BasicDAO.sol`).
3. Copy and paste the contract code above into the file.
4. Open the **Solidity Compiler** tab, select version `0.8.19`, and click **Compile**.
5. Open the **Deploy & Run Transactions** tab.
6. Select `Injected Provider (MetaMask)` as the environment and connect your wallet.
7. Ensure the network is correctly set to **Westend Asset Hub**.
8. Click **Deploy** and confirm the transaction in MetaMask.

### Playing with the Deployed Contract:
Once deployed, you can interact with the contract using Remix’s UI:

- **Add a Member**: Call `addMember(address)` to add a new DAO member.
- **Create a Proposal**: Call `createProposal(string description)` to submit a new proposal.
- **Vote on a Proposal**: Call `vote(uint proposalId)` to cast a vote.
- **Execute a Proposal**: Call `executeProposal(uint proposalId)` to finalize an approved proposal.
- **Get Proposal Details**: Call `getProposal(uint proposalId)` to view a proposal’s status.

Congratulations! You’ve successfully deployed and interacted with your first DAO contract on Remix!

