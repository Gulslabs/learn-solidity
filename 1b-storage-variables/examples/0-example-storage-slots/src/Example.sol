// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract Example {
    uint256 constant a = 55; // constant stored within the smart contract; its consistenty that value. Not stored on Storage. 
    uint256 b = type(uint256).max; // storage slot - 0x0
    bool c = true; // storage slot - 0x1

    constructor() {
        // SSTORE - store to some storage location
        // SLOAD - read from some storage location
        uint x;
        bool y; 
        uint256 asHex;
        assembly {
            x := sload(0x0)
            y := sload(0x1)
            asHex := sload(0x0)
        }
        console.log(x);
        console.log(y);
        // prints 0xfffff.... 
        console.logBytes32(bytes32(asHex));
    }
    
}
