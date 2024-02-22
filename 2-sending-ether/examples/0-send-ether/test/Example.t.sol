// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/Example.sol";

contract ExampleTest is Test {
    A public a;
    B public b;

    function setUp() public {
        b = new B();
        // here b refers to the contract. typecast it using address function. 
        // notice A's constructor has no logic to capture msg.value; 
        // this 1 ETH is automatically added to balance of A smart contract instance
        a = new A{ value: 1 ether }(address(b));
    }

    function testExample() public {
        assertEq(address(a).balance, 1 ether);
        assertEq(address(b).balance, 0 ether);
        a.payHalf();
        assertEq(address(a).balance, 0.5 ether);
        assertEq(address(b).balance, 0.5 ether);
        a.payHalf();
        assertEq(address(a).balance, 0.25 ether);
        assertEq(address(b).balance, 0.75 ether);
        a.payHalf();
        assertEq(address(a).balance, 0.125 ether);
        assertEq(address(b).balance, 0.875 ether);
    }
}
