// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract A {
    address b;

    constructor(address _b) payable {
        b = _b;
        console.log("Received Value: ", msg.value);
        console.log("B's Address: " , b);
        console.log("B's Balance: ", b.balance);        
        console.log("A's Address: ", address(this));
        console.log("A's Balance: ", address(this).balance);
        
    }

    function payHalf() external {
        uint256 balance = address(this).balance;
        // wont work if B did not have receive method. 
        (bool success,) = b.call{value: balance / 2}("");
        require(success);        
    }
}

contract B {
    receive() external payable {}
}
