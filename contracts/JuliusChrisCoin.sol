// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract JuliusChrisCoin is ERC20, Ownable {
    uint256 public constant totalSupply = 10000 * 10**18;
    uint256 public constant burnPercentage = 3;

    constructor() ERC20("JuliusChrisCoin", "JCC") {
        _mint(msg.sender, totalSupply);
    }

    function _transfer(address sender, address recipient, uint256 amount) internal override {
        uint256 burnAmount = (amount * burnPercentage) / 100;
        uint256 sendAmount = amount - burnAmount;
        
        super._transfer(sender, recipient, sendAmount);
        super._transfer(sender, address(0), burnAmount);
    }
}