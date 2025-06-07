```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract UndefinedToken is ERC20, Ownable {
    uint256 public burnPercentage = 2; // Define burn percentage on transfers

    constructor() ERC20("undefined", "undefined") {
        _mint(msg.sender, 1000000 * 10 ** decimals()); // Set total supply
    }

    function _transfer(address sender, address recipient, uint256 amount) internal virtual override {
        uint256 burnAmount = (amount * burnPercentage) / 100;
        uint256 transferAmount = amount - burnAmount;

        super._transfer(sender, recipient, transferAmount);
        _burn(sender, burnAmount); // Burn the defined percentage
    }

    // Override mint function to disable minting
    function mint(address to, uint256 amount) public virtual onlyOwner {
        revert("Minting is not allowed");
    }
}
```