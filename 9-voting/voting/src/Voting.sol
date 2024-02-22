// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract Voting {
    
    enum VoteState {NotVoted, Yes, No}

    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
        mapping(address=>VoteState) voteStates; 
        bool executed; 
    }

    Proposal[] public proposals;    
    address[] public members; 
    event ProposalCreated(uint proposalId);
    event ProposalExecuted(uint proposalId);
    event VoteCast(uint proposalId, address voter);

    constructor(address[] memory _members) {
         for (uint256 i = 0; i < _members.length; i++) {
            members.push(_members[i]);
        }
        members.push(msg.sender);
    }

    modifier membersOnly() {
        bool isMember = false; 
        for(uint i=0; i<members.length; i++) {          
            if(members[i]==msg.sender) {                
                isMember=true;
                break; 
            }
        }        
        require(isMember, "Only Members can create new Proposal or Cast Vote");
        _;
    }

    function newProposal(address _target, bytes memory _data) external membersOnly {
        Proposal storage proposal = proposals.push(); 
        proposal.target = _target; 
        proposal.data = _data;
        emit ProposalCreated(proposals.length -1);  
    }

    
    function castVote(uint _proposalId, bool _suggestion) external membersOnly {
        // Here we made an assumption that proposal already exists in the array.
        // Not addressing index out-of-bound issue. 
        Proposal storage proposal = proposals[_proposalId];
        if(proposal.voteStates[msg.sender]== VoteState.Yes) {
            proposal.yesCount--;
        }

        if(proposal.voteStates[msg.sender]== VoteState.No) {
            proposal.noCount--;
        }

        if(_suggestion) {
            proposal.yesCount++; 
        }        
        else {
            proposal.noCount++; 
        }
        proposal.voteStates[msg.sender] = _suggestion ? VoteState.Yes: VoteState.No;         
        emit VoteCast(_proposalId, msg.sender);

        if(proposal.yesCount>=10 && !proposal.executed) {
            proposal.target.call(proposal.data);
            proposal.executed = true; 
            emit ProposalExecuted(_proposalId);
        }
    }

}
