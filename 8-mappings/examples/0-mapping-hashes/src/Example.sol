// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract Example {
    // changing the base slot.
    uint256 x; // 0x0
    mapping(address => bool) isMember; // base slot 0x1

    function join() external {
        // THE LONG WAY OF ACCESSING MAPS. 
        // SSTORE(keccak256(msg.sender + 0x0), true)
        // abi.encode converts to hex decimal for base type (i.e. less than 32 bytes)
        // here 20 bytes address is converted to 32 bytes
        bytes32 slot = keccak256(abi.encode(msg.sender, 1));
        assembly {
            sstore(slot, true)
        }
        //isMember[msg.sender] = true;
    }

    function belongs() external view returns (bool) {
        // SLOAD(keccak256(msg.sender + 0x0))
        bytes32 slot = keccak256(abi.encode(msg.sender, 1));
        bool value;
        assembly {
            value := sload(slot)
        }        
         return value;
        // return isMember[msg.sender];
       
    }
}
