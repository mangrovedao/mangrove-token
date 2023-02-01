// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.13;

import "src/MangroveToken.sol";
import "forge-std/Script.sol";
import {Test} from "forge-std/Test.sol";

// forgefmt: disable-start
address constant MGV_TOKEN_ADDRESS = 0x7777F41A060377B3640F8B5E3bB78e37BD487777;

address constant ADDMA          = 0x0813Ec5f3b54003197d8B40A36Ed570E803cfBF7;

uint8 constant TRANSFER_ROLE = 0;
uint8 constant MINT_ROLE = 1;
// forgefmt: disable-end

contract Deploy is Script, Test {
  MangroveToken public mgvToken;

  function run() external {
    vm.startBroadcast(ADDMA);
    // create token
    uint salt = 105175972869581608376594353207480889881588272671706165921403646589759150784068;
    mgvToken = new MangroveToken{salt:bytes32(salt)}(ADDMA);
    console.log(address(mgvToken));

    // forgefmt: disable-start
    // assign roles
    mgvToken.setRoleCapability(TRANSFER_ROLE, Token.transfer.selector,     true);
    mgvToken.setRoleCapability(TRANSFER_ROLE, Token.transferFrom.selector, true);
    mgvToken.setRoleCapability(MINT_ROLE,     Token.mint.selector,         true);
    // forgefmt: disable-end

    vm.stopBroadcast();
    check();
  }

  function check() public {
    assertEq(mgvToken.owner(), ADDMA);
    assertEq(mgvToken.doesRoleHaveCapability(TRANSFER_ROLE, Token.transfer.selector), true);
    assertEq(mgvToken.doesRoleHaveCapability(TRANSFER_ROLE, Token.transferFrom.selector), true);
    assertEq(mgvToken.doesRoleHaveCapability(MINT_ROLE, Token.mint.selector), true);
    assertEq(address(mgvToken), MGV_TOKEN_ADDRESS);
  }
}
