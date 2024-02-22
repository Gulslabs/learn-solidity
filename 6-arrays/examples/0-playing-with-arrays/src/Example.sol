// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract Example {
    // fixed size array
    uint256[3] favoriteNumbers;

    constructor() {
        // passing it to modifyArray
        modifyArray(favoriteNumbers);

        console.log(favoriteNumbers[0]); // 22
        console.log(favoriteNumbers[1]); // 23
        // if you access index 3; you get compile time error. 
        // favoriteNumbers[3] = 33;
        // however below code fails only during execution. 
       // uint x = 3;
       //abi favoriteNumbers[x] = 20;
    }

    function modifyArray(uint256[3] storage nums) private {
        nums[0] = 22;
        nums[1] = 23;
    }

      function sum(uint[5] calldata nums) external pure returns (uint) {
        uint total = 0;
        for (uint i=0; i<nums.length; i++) {
            total +=nums[i];
        }
        return total;
    }

    function filterEvent(uint[] calldata nums) external returns (uint[] memory){
        uint8 evenCount = 0; 
        for (uint i=0; i<nums.length; i++) {
            if(nums[i]%2==0) {
                evenCount++; 
            }
        }

       uint[] memory evenNumbers = new uint[](evenCount);
           
        uint j;
        //for (uint i=0, uint j = 0; i<nums.length; i++) {

        for (uint i = 0; i < nums.length; i++) {
            if(nums[i]%2==0) {
                evenNumbers[j++] = nums[i];
            }
        }
        return evenNumbers;
    }
}
