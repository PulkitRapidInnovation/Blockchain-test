// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract SendEther {
    event Received(address, uint);
    receive() external payable {
        emit Received(msg.sender, msg.value);
    }
}