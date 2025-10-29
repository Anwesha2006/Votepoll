# 🗳️ VotePoll – A Simple Decentralized Voting System

## 📖 Project Description

**VotePoll** is a simple and transparent decentralized voting system built on the **Celo Sepolia Testnet**.  
It allows anyone to vote for one of three candidates — **Alice**, **Bob**, or **Charlie** — directly on the blockchain.  
Every vote is stored immutably, ensuring fairness, transparency, and no double voting.

This project demonstrates the **power of Solidity smart contracts** for governance or polling applications, making it perfect for blockchain beginners and learners.

---

## 💡 What It Does

- Lets users vote for **Alice**, **Bob**, or **Charlie**.  
- Ensures each wallet can **vote only once**.  
- Displays total votes and automatically finds the **current winner**.  
- Provides a **fully on-chain record** of all voting actions.

---

## ✨ Features

✅ **No setup needed** – candidates are already added.  
✅ **One-click voting** – use any of the three voting functions.  
✅ **Anti-double-voting** – one vote per address only.  
✅ **View live results** – check votes and see who’s winning anytime.  
✅ **Beginner-friendly** – clean, minimal, and easy to deploy.

---

## 🌐 Deployed Smart Contract

- **Network:** Celo Sepolia Testnet  
- **Contract Address:** [`0x9C9A9A031BdF4Cc01213Fd3bD65AC0003c958b0b`](https://explorer.celo.org/alfajores/address/0x9C9A9A031BdF4Cc01213Fd3bD65AC0003c958b0b)  
- **Verified On:** [Sourcify.eth](https://sourcify.dev) ✅  
- **Compiler:** Solidity `0.8.30`  
- **Verification Date:** 2025-10-29  
- **Deployer Address:** `0xD407A8bB31612DE8F5370561DC58035C4ac81355`

![Verified on Sourcify](./Screenshot%202025-10-29%20141207.png)

---

## 🧠 How to Use

1. Open **[Remix IDE](https://remix.ethereum.org/)**.  
2. Paste the code below in a new file `VotePoll.sol`.  
3. Compile using **Solidity 0.8.0+**.  
4. Deploy it (no constructor arguments needed).  
5. Use these functions to interact:

| Function | Description |
|-----------|--------------|
| `voteForAlice()` | Cast a vote for Alice |
| `voteForBob()` | Cast a vote for Bob |
| `voteForCharlie()` | Cast a vote for Charlie |
| `getVotes()` | View the total votes for all candidates |
| `getWinner()` | See the name of the candidate with the most votes |

---

## 🧩 Smart Contract Code

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotePoll {
    address public owner;
    string[] public candidates = ["Alice", "Bob", "Charlie"];
    uint256[] public votes = [0, 0, 0];
    mapping(address => bool) public hasVoted;

    constructor() {
        owner = msg.sender;
    }

    function voteForAlice() public {
        require(!hasVoted[msg.sender], "You already voted!");
        votes[0]++;
        hasVoted[msg.sender] = true;
    }

    function voteForBob() public {
        require(!hasVoted[msg.sender], "You already voted!");
        votes[1]++;
        hasVoted[msg.sender] = true;
    }

    function voteForCharlie() public {
        require(!hasVoted[msg.sender], "You already voted!");
        votes[2]++;
        hasVoted[msg.sender] = true;
    }

    function getVotes() public view returns (uint256[] memory) {
        return votes;
    }

    function getWinner() public view returns (string memory) {
        uint winnerIndex = 0;
        uint highest = votes[0];

        for (uint i = 1; i < votes.length; i++) {
            if (votes[i] > highest) {
                highest = votes[i];
                winnerIndex = i;
            }
        }

        return candidates[winnerIndex];
    }
}
