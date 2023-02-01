# Mangrove Token

The Mangrove Governance Token (MGV Token) is deployed on Ethereum at [0x7777F41A060377B3640F8B5E3bB78e37BD487777](https://etherscan.io/address/0x7777f41a060377b3640f8b5e3bb78e37bd487777#code). It has been [audited](audits/omniscia.pdf) by [Omniscia](https://omniscia.io/).

The MGV contract inherits the [semi-transferable token](https://github.com/mangrovedao/semitransferable-token). The token will initially be non-transferable. Mangrove will gradually allow transferability for specific contracts (e.g. vesting contracts), and eventually enable full transferability by setting:

```solidity
token.setPublicCapability(Token.transfer.selector, true);
token.setPublicCapability(Token.transferFrom.selector, true);
```

## Setup

After cloning the repo, run:
```bash
git submodule update --init --recursive
```

Tests can be run using:
```bash
forge test
```
