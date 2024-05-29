pragma solidity ^0.8.15;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "@hack/staking/staking.sol";
import "@hack/staking/erc20.sol";


contract StakingTest is Test {
    
    uint constant WAD = 10**18;
    StakingRewards staking;
    myToken rt;
    myToken st;
    address user= vm.addr(123);
    //newStake public s;

    // Everything I need to start my test
    function setUp() public {
     //   s = new newStake();
        // st = new ERC20('Staking_Token');
        // rt=new ERC20('Reward_Token');
        // staking= new StakingRewards(address(st), address(rt));
        // rt.mint(address(staking), 100_00*WAD);
        // st.mint(user, 1000*wad);
        
        // console.log(address(this));
    }

   




    function testReward() public {
        address randAdress= vm.addr(1111);
        vm.startPrank(randAdress);
        uint amount = 50;
        vm.deal(randAdress, amount);
        vm.stopPrank();
        
    }

}