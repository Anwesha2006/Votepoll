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
