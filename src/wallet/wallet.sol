// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Wallet {
    address payable private owner;
    mapping (address => uint256) public hasGabaim;

    // Constructor: Initializes contract with owner and predefined addresses
    constructor() {
        owner = payable(msg.sender);
        // Predefined addresses that can withdraw
        hasGabaim[0xaC4E320Ed1235F185Bc6AC8856Ec7FEA7fF0310d] = 1;
        hasGabaim[0x7a3b914a1f0bD991BAf826F4fE9a47Bb9880d25f] = 1;
        hasGabaim[0x0638cF39b33D063c557AE2bC4B5D22a790Ac8Fe4] = 1;
    }

    // Fallback function: Allows the contract to receive Ether
    receive() external payable {}

    // Withdraw function: Allows owner and predefined addresses to withdraw Ether
    function withdraw(uint256 amount) external {
        require(
            owner == msg.sender || hasGabaim[msg.sender] == 1,
            "Only the owner and predefined addresses are allowed to withdraw Ether"
        );
        require(address(this).balance >= amount, "Insufficient balance");
        payable(msg.sender).transfer(amount);
    }

    // Get Balance function: Returns the contract's balance
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
