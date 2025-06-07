Below is a valid Solidity code for an ERC-20 token named CarameloCoin (CCC) with a total supply of 1000, a 1% burn on transfers, and a mint function. This implementation uses OpenZeppelin's library.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CarameloCoin is ERC20, Ownable {
    uint256 public constant INITIAL_SUPPLY = 1000 * 10**18; // Initial supply in wei (with 18 decimals)

    constructor() ERC20("CarameloCoin", "CCC") {
        _mint(msg.sender, INITIAL_SUPPLY);
    }

    function _transfer(address sender, address recipient, uint256 amount) internal virtual override {
        uint256 burnAmount = amount / 100; // 1% burn
        uint256 sendAmount = amount - burnAmount;

        super._transfer(sender, address(0), burnAmount); // Burn the amount
        super._transfer(sender, recipient, sendAmount); // Transfer the remaining amount
    }

    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }
}
```

This code includes a burn mechanism that deducts 1% of the transferred amount and sends it to the zero address (effectively burning it). Additionally, only the owner of the contract can mint new tokens.