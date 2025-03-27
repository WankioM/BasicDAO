// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BasicDAO {
    struct Proposal {
        string description;
        uint voteCount;
        bool executed;
    }

    address public owner;
    Proposal[] public proposals;
    mapping(address => bool) public members;
    mapping(uint => mapping(address => bool)) public hasVoted; // Tracks if a member has voted on a proposal

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    modifier onlyMember() {
        require(members[msg.sender], "Not a DAO member");
        _;
    }

    constructor() {
        owner = msg.sender;
        members[msg.sender] = true; // The creator is the first member
    }

    function addMember(address _member) public onlyOwner {
        members[_member] = true;
    }

    function createProposal(string memory _description) public onlyMember {
        proposals.push(Proposal({
            description: _description,
            voteCount: 0,
            executed: false
        }));
    }

    function vote(uint _proposalId) public onlyMember {
        require(_proposalId < proposals.length, "Invalid proposal ID");
        require(!hasVoted[_proposalId][msg.sender], "Already voted");

        proposals[_proposalId].voteCount++;
        hasVoted[_proposalId][msg.sender] = true;
    }

    function executeProposal(uint _proposalId) public onlyOwner {
        require(_proposalId < proposals.length, "Invalid proposal ID");
        require(!proposals[_proposalId].executed, "Proposal already executed");
        require(proposals[_proposalId].voteCount > 0, "Not enough votes");

        proposals[_proposalId].executed = true;
        // Execution logic here (could trigger another contract function)
    }

    function getProposal(uint _proposalId) public view returns (string memory, uint, bool) {
        require(_proposalId < proposals.length, "Invalid proposal ID");
        Proposal storage proposal = proposals[_proposalId];
        return (proposal.description, proposal.voteCount, proposal.executed);
    }
}
