// SPDX-License-Identifier: GNU AGPLv3
pragma solidity ^0.8.13;

import {MangroveToken, Token} from "src/MangroveToken.sol";
import {Test} from "forge-std/Test.sol";
import {Script} from "forge-std/Script.sol";
import "forge-std/console2.sol";

/// @dev Simple smoke test
/// @dev For in depth tests, directly check Solmate and Semitransferable Token repositories.
contract MangroveTokenTest is Test, Script {
  MangroveToken public mangroveToken;
  address ADDMA = 0x0813Ec5f3b54003197d8B40A36Ed570E803cfBF7;

  function testConstructor(address owner) public {
    MangroveToken mgvToken = new MangroveToken(owner);
    assertEq(mgvToken.owner(), owner, "wrong owner");
    assertEq(mgvToken.symbol(), "MGV", "wrong symbol");
    assertEq(mgvToken.name(), "Mangrove Token", "wrong name");
    assertEq(mgvToken.decimals(), 18, "wrong decimals");
  }
}
