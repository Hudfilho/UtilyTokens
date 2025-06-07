```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CustomToken is ERC20, Ownable {
    uint256 public burnPercentage = 5; // Example burn percentage (5%)
    
    constructor() ERC20("undefined", "undefined") {
        _mint(msg.sender, 1000000 * 10 ** decimals()); // Example total supply of 1,000,000 tokens
    }

    function _transfer(address sender, address recipient, uint256 amount) internal override {
        uint256 burnAmount = (amount * burnPercentage) / 100;
        uint256 sendAmount = amount - burnAmount;
        require(sendAmount > 0, "Transfer amount must be greater than zero");
        
        super._transfer(sender, recipient, sendAmount);
        _burn(sender, burnAmount);
    }
}
```