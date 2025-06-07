// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CarameloCoin is ERC20, Ownable {
    uint256 public constant INITIAL_SUPPLY = 1000 * (10 ** 18);
    
    constructor() ERC20("CarameloCoin", "CCC") {
        _mint(msg.sender, INITIAL_SUPPLY);
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        uint256 burnAmount = amount / 100;
        uint256 sendAmount = amount - burnAmount;
        _burn(_msgSender(), burnAmount);
        _transfer(_msgSender(), recipient, sendAmount);
        return true;
    }

    function mint(uint256 amount) public onlyOwner {
        _mint(msg.sender, amount);
    }
}