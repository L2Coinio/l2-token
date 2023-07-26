// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;


import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20Permit} from "@openzeppelin/contracts/token/ERC20/extensions/draft-ERC20Permit.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

import {IL2} from "../interfaces/IL2.sol";

contract L2 is IL2, ERC20, ERC20Permit, Ownable {

    constructor()
        ERC20("L2", "L2")
        ERC20Permit("L2") {}

    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    function burn(uint256 amount) external {
        _burn(_msgSender(), amount);
    }

}
