// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TigrinhoCoin is ERC20, Ownable {
    constructor() ERC20("TigrinhoCoin", "TIG") {
        _mint(msg.sender, 1000 * 10 ** decimals());
    }

    function _transfer(address sender, address recipient, uint256 amount) internal override {
        uint256 burnAmount = amount / 100;
        uint256 sendAmount = amount - burnAmount;
        super._transfer(sender, address(0), burnAmount);
        super._transfer(sender, recipient, sendAmount);
    }

    function mint(uint256 amount) public onlyOwner {
        _mint(msg.sender, amount);
    }
}