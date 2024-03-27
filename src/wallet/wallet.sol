// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Wallet {
    address payable public owner;
    mapping (address => uint256) public gabaim;

    // Constructor: Initializes contract with owner and predefined addresses
    constructor() {
        owner = payable(msg.sender);
        // Predefined addresses that can withdraw
        gabaim[0x21D665Ed3E95a19a19DCaf330e2d12bE0f43144f] = 1;
        gabaim[0x2691200b3624C82757F28B52E4573bB61f6CCFf4] = 1;
        gabaim[0x68BF2f4E4091C29dFa88B2c8bCBB65f00A63CE04] = 1;
    }

    // Fallback function: Allows the contract to receive Ether
    receive() external payable {}

    // Withdraw function: Allows owner and predefined addresses to withdraw Ether
    function withdraw(uint256 amount) external {
        require(
            owner == msg.sender || gabaim[msg.sender] == 1,
            "Only the owner and predefined addresses are allowed to withdraw Ether"
        );
        require(address(this).balance >= amount, "Insufficient balance");
        payable(msg.sender).transfer(amount);
    }

    function update(address oldGabai, address newGabai) public{
    
        require(owner == msg.sender, "Only the owner can update"); //only owner can update gabaaim
        require(gabaim[oldGabai]==1,"the old gabai is not exist"); // check if gabbai exist in the hash
        require(gabaim[newGabai]==0,"the gabai is exist"); // check if gabbai exist in the hash
        gabaim[newGabai]=1;
        delete gabaim[oldGabai];
    }

    // Get Balance function: Returns the contract's balance
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
