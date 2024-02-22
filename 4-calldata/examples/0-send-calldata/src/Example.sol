// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract A {
    uint256 public sum;
    address b;

    constructor(address _b) {
        b = _b;
        // (bool success, bytes memory returnData) = b.call(
        // hex"771602f70000000000000000000000000000000000000000000000000000000000000005000000000000000000000000000000000000000000000000000000000000000a"
        // );        
        // require(success);
        // sum = abi.decode(returnData, (uint256));
        //_bsum = B(b).add(15, 10);
        sum = iB(b).add(15, 10);
        (bool success, ) = hero.call(abi.encodeWithSignature("alert1(uint256,bool)",10,true))
        
        
    }
}

interface iB {
    function add(uint256, uint256) external pure returns (uint256);
}

contract B {
    fallback() external {
        // method signature 4 bytes. 
        console.logBytes4(msg.sig);
        // entire call data. 
        console.logBytes(msg.data);
    }

    function add(uint256 x, uint256 y) external view returns (uint256) {
        console.log(x); 
        console.log(y);
        return x + y;
    }
}
