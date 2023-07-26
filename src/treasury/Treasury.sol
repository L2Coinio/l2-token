// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

import {RewardsManager} from "../abstract/RewardsManager.sol";

import {IL2} from "../interfaces/IL2.sol";

contract Treasury is RewardsManager {

    constructor(address rewardsToken_) RewardsManager(rewardsToken_, 1000e18) {}

    function distributionRewards(address rewardPool_, uint256 amount_) external onlyOwner {
        require(rewardPool_ != address(0), "Treasury: reward pool is zero address");
        require(amount_ > 0, "Treasury: amount is zero");
        IERC20(rewardsToken).transfer(rewardPool_, amount_);
    }

}
