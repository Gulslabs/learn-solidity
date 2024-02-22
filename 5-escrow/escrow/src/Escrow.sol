// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Escrow {

    address public depositor; 
    address public beneficiary;
    address public arbiter;    

    event Approved(uint);

    constructor(address _arbiter,address _beneficiary) payable {
        depositor = msg.sender; 
        beneficiary = _beneficiary; 
        arbiter = _arbiter;
    }
    modifier arbiterOnly {
        if(msg.sender!= arbiter){
            revert();        
        }
        _;        
    }


    function approve() arbiterOnly external payable {    
      uint balance =  address(this).balance;
      (bool s, ) =   beneficiary.call{value: balance}("");
      require(s);
      emit Approved(balance);
    }
}