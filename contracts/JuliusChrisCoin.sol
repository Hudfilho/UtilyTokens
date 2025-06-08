// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract JCCToken is ERC20, Ownable {
    uint256 public constant TOTAL_SUPPLY = 10000 * 10 ** 18;
    uint256 public constant BURN_RATE = 3;

    constructor() ERC20("undefined", "JCC") {
        _mint(msg.sender, TOTAL_SUPPLY);
    }

    function _transfer(address sender, address recipient, uint256 amount) internal override {
        uint256 burnAmount = (amount * BURN_RATE) / 100;
        uint256 transferAmount = amount - burnAmount;
        
        super._transfer(sender, address(0), burnAmount);
        super._transfer(sender, recipient, transferAmount);
    }
}