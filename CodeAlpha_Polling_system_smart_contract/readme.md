# Polling System Smart Contract

## Project Overview

This project is developed as part of the CodeAlpha Blockchain Development Internship. The project focuses on creating a decentralized polling system using blockchain technology and smart contracts.

The main objective of this project is to develop a secure and transparent voting system where users can participate in polls without relying on a centralized authority. The smart contract manages poll creation, vote recording, and result tracking in a decentralized manner.

## About Polling System Smart Contract

A smart contract is a self-executing program stored on a blockchain that automatically performs actions when predefined conditions are met.

In this project, a smart contract is used to create a blockchain-based polling system where votes are securely recorded and stored. Since blockchain records are immutable, the voting data cannot be modified or manipulated after submission.

## Features

- Create polls using smart contracts
- Add voting options/candidates
- Allow users to cast votes
- Store votes securely on blockchain
- Prevent multiple voting by the same user
- Transparent vote counting
- Decentralized voting mechanism
- Tamper-resistant records

## Technologies Used

- Solidity
- Ethereum Blockchain
- Remix IDE
- MetaMask
- Web3.js / Ethers.js
- Ganache (for local blockchain testing)

## Smart Contract Functions

The smart contract provides the following functionalities:

### Create Poll

Allows the administrator to create a new poll with different voting options.

### Add Candidates/Options

Adds available choices that users can vote for.

### Cast Vote

Allows users to submit their vote securely through the blockchain.

### Check Results

Displays the total votes received by each option.

### Vote Validation

Ensures that each user can vote only once.

## Working of the Application

The polling system works using a Solidity-based smart contract deployed on an Ethereum blockchain network.

The administrator first creates a poll and adds voting options. Users connected through their blockchain wallets can then participate by selecting an option and submitting their vote.

Each vote is recorded as a blockchain transaction. The smart contract verifies the voter and updates the vote count. Once voting is completed, results can be viewed transparently from the blockchain.

## Smart Contract Workflow

1. Deploy the smart contract on blockchain network.
2. Create a new poll.
3. Add voting options.
4. Connect user wallet.
5. Cast votes through the smart contract.
6. Store voting records on blockchain.
7. Display final poll results.

## Project Structure

Polling-System-Smart-Contract

- contracts
  - PollingSystem.sol

- deployment
  - deployment_details.txt

- screenshots

- README.md

## How to Run the Project

1. Install required tools:
   - Remix IDE
   - MetaMask wallet

2. Open Remix IDE.

3. Create a new Solidity file.

4. Upload or paste the smart contract code.

5. Compile the contract using Solidity compiler.

6. Deploy the contract using Remix deployment environment.

7. Connect MetaMask wallet.

8. Interact with the contract functions:
   - Create Poll
   - Add Options
   - Vote
   - View Results

## Security Features

- Blockchain-based vote storage
- Prevention of duplicate voting
- Transparent transaction records
- Decentralized data management
- Smart contract-based automation

## Project Deliverables

The project includes:

- Solidity smart contract
- Contract deployment details
- Transaction screenshots
- Testing results
- Project documentation

## Learning Outcomes

Through this project, I learned:

- Fundamentals of blockchain development
- Smart contract programming using Solidity
- Ethereum blockchain interaction
- Deploying and testing smart contracts
- Understanding decentralized applications
- Secure transaction handling

## Future Enhancements

- Add user authentication using blockchain wallets
- Implement voting deadlines
- Add encrypted voting mechanisms
- Develop a frontend DApp interface
- Deploy on a public blockchain network
- Improve smart contract security

## Author

Mitushi Jain

## Internship Program

CodeAlpha Blockchain Development Internship

## License

This project is created for educational and internship purposes.
