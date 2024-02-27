// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Sender {
    // Function to send value to another contract
    function sendValue(address payable recipient) external payable {
        // OPTION 1:  Use call function to send Ether to the recipient contract
        (bool success, ) = recipient.call{value: msg.value}("");
        require(success, "Transfer failed");
        // OPTION 2:  Use transfer function to send Ether to the recipient contract
        // recipient.transfer(msg.value);
        
    }
}

contract Receiver {
    // Event to log the received value
    event ValueReceived(address indexed sender, uint256 value);

    // Function to receive value
    receive() external payable {
        emit ValueReceived(msg.sender, msg.value);
    }
}
