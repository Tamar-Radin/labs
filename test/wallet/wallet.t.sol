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

    function testDeposit() public {

        uint256 balanceBefore = address(w).balance;
	    // Call the deposit function of the Wallet contract with 1 ether
        (bool success, ) = address(w).call{value: 1 ether}("");
        require(success, "Deposit failed");
	    uint256 balanceAfter = address(w).balance;
	    assertEq(balanceAfter - balanceBefore, 1 ether, "expect increase of 1 ether");
        
    }

    function testWithdraw() public {
        
    }
}
