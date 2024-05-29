include "util/number.dfy"
include "util/maps.dfy"
include "util/tx.dfy"
include ".../src/aaveLending.sol"
include "erc20.dfy"

import opened Number
import opened Maps
import opened Tx

class Bond {
  // a 160-bit unsigned integer that uniquely identifies the address. However,
  // this value is not directly used as the external representation, that is in u256
    var dai: ERC20
    var bond: ERC20

    const baseRate: u256 := 20_000_000_000_000_000    // 0.02 [wad]
    const annuRate: u256 := 300_000_000_000_000_000   // 0.3  [wad]

    // totals
    var borrow:  u256
    var lends:   u256
    var reserve: u256
    var collateral: u256
    var balances:   mapping<u160, u256>
    var user_collateral: mapping<u160, u256>
    var borrowed:   mapping<u160, u256>

    constructor() {
        dai := new ERC20();
        bond := new ERC20();
        borrow    := 0;
        lends     := 0;
        collateral:= 0;
    }
method supply(msg:Transaction ,amount: u256) returns (r:u256)
requires amount > 0 
ensures r-amount == {
    var item :| item in amount;
    return item;
}
}