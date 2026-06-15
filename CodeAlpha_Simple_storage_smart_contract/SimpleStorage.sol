// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleStorage {

    uint public value = 0;

    function increment() public {
        value++;
    }

    function decrement() public {
        require(value > 0, "Value cannot be negative");
        value--;
    }
}