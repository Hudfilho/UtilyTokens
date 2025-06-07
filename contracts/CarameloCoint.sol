// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CarameloCoint is ERC20, Ownable {
    uint256 public constant INITIAL_SUPPLY = 1000 * 10 ** 18;

    constructor() ERC20("CarameloCoint", "CCC") {
        _mint(msg.sender, INITIAL_SUPPLY);
    }

    function _transfer(address sender, address recipient, uint256 amount) internal virtual override {
        uint256 burnAmount = amount / 100; // 1% burn
        uint256 amountAfterBurn = amount - burnAmount;
        super._transfer(sender, address(0), burnAmount); // burn the tokens
        super._transfer(sender, recipient, amountAfterBurn);
    }

    function mint(uint256 amount) public onlyOwner {
        _mint(msg.sender, amount);
    }
}