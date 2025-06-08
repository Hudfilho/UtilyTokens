// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract GoticaRabudaCoin is ERC20, Ownable {
    uint256 private constant INITIAL_SUPPLY = 100000 * 10 ** 18;

    constructor() ERC20("GoticaRabudaCoin", "NHAC") {
        _mint(msg.sender, INITIAL_SUPPLY);
    }

    function _transfer(address sender, address recipient, uint256 amount) internal override {
        uint256 burnAmount = amount / 100;
        uint256 transferAmount = amount - burnAmount;

        super._transfer(sender, recipient, transferAmount);
        _burn(sender, burnAmount);
    }
}