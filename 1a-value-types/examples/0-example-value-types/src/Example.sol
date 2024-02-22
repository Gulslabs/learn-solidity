// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract Example {

    uint8 a = 255; // 0 -> 255
    uint256 b =  type(uint256).max; // alias: uint


    int8 c = 127; // -128 -> 127
    int256 d = -55; // alias: int256

    bool myCondition = true;

    enum Choice {
        Up,
        Down,
        Left,
        Right
    }
    
    constructor(Choice choice) {
        unchecked{
            a+=1;
            a+=1;
            a+=1;
        }
    console.log("Max Value" ,  b);      

    // 256 bit represented as 32 bytes. Max value as hex
    console.logBytes32(bytes32(b));
    // Max and Min Int
    console.logInt(type(int).min);
    console.logInt(type(int).max);
    // Max and Min Unsigned Int
    console.logInt(type(int8).min);
    console.logInt(type(int8).max);
    if(myCondition){
        console.log("yay!");
        }
    if(choice == Choice.Up) {
         console.log("Up");
    }

     if(choice == Choice.Down) {
         console.log("Down");
    }

    }

   

   // Choice choice = Choice.Up;
}
