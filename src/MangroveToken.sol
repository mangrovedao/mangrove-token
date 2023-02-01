// SPDX-License-Identifier: GNU AGPLv3
pragma solidity ^0.8.13;

import "semitransferable-token/Token.sol";

/// @author ADDMA
contract MangroveToken is Token {
  /// @param _owner The address of the owner
  constructor(address _owner) Token("Mangrove Token", "MGV", 18, _owner) {}
}
