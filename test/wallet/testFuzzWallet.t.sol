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


    }
    function testFuzzDepossit(uint96 amount) public {

        uint256 preBalance = address(w).balance;
        Vm.assume(amount > 0 && amount <= 100 ether);
        payable(address(w)).transfer(amount);
        uint256 postBalance = address(w).balance;
        assert(preBalance + amount = postBalance);

        //assertEq(preBalance + amount, postBalance);
    }

    function testFuzzWithdraw(uint256 amount){

          //  function testWithdraw() public {

        address userAllow = 0x21D665Ed3E95a19a19DCaf330e2d12bE0f43144f;
        vm.startPrank(userAllow);
        vm.assume(amount > 0.1 ether);
        vm.deal(address(w), amount);
        uint256 balanceBefore = address(userAllow).balance;
        w.withdraw(amount);
        uint256 balanceAfter = address(userAllow).balance;
        assertEq(balanceBefore+amount, balanceAfter);
        

        vm.stopPrank();

    }
    //}

