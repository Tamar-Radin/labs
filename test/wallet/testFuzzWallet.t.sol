 // SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "@hack/wallet/wallet.sol";


contract WalletTest is Test {
    Wallet public w;

    // Everything I need to start my test
    function setUp() public {
        w = new Wallet();
        console.log(address(this));
    }
 function testFuzz_Withdraw(uint96 amount) public {

        uint256 preBalance = address(w).balance;
        vm.assume(amount > 0 && amount <= 100 ether);
        payable(address(w)).transfer(amount);
        
       // w.withdraw(amount);
        uint256 postBalance = address(w).balance;
        assertEq(preBalance + amount, postBalance);
    }

        // Test deposit function
    // function testFuzz_Deposit(uint256 depositAmount) public {
    //     // Record the balance before deposit
    //     uint256 preBalance = address(w).balance;

    //     // Assumptions
    //     vm.assume(depositAmount > 0 && depositAmount <= 1000 ether); // Deposit amount should be positive and less than or equal to 1000 ether

    //     // Act
    //     payable(address(w)).transfer(depositAmount);

    //     // Assert
    //     assertGt(address(w).balance, preBalance, "Contract balance should increase by deposit amount");
    // }

}