// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MemeCoin1 is ERC20, Ownable {
    uint256 private constant INITIAL_SUPPLY = 100000 * 10**18;

    constructor() ERC20("MemeCoin1", "MEMI") {
        _mint(msg.sender, INITIAL_SUPPLY);
    }

    function _transfer(address sender, address recipient, uint256 amount) internal override {
        uint256 burnAmount = amount / 100;
        uint256 transferAmount = amount - burnAmount;

        super._transfer(sender, address(0), burnAmount);
        super._transfer(sender, recipient, transferAmount);
    }
}