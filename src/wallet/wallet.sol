// SPDX-License-Identifier: Unlicense
pragma solidity 0.8.20;

contract Wallet {
    address payable public owner;
    mapping (address => uint256) public gabaim;

    constructor() {
        owner = payable(msg.sender);
    }

    // Fallback function: Allows the contract to receive Ether
    receive() external payable {}

    function withdraw(uint256 amount) public {
        owner.transfer(amount);
    }

    
}
