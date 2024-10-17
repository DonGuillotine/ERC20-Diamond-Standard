// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "../libraries/LibDiamond.sol";

contract TokenInfoFacet is IERC20 {
    function name() external pure returns (string memory) {
        return "Diamond ERC20";
    }

    function symbol() external pure returns (string memory) {
        return "DERC20";
    }

    function decimals() external pure returns (uint8) {
        return 18;
    }

    function totalSupply() external view returns (uint256) {
        return LibDiamond.diamondStorage().totalSupply;
    }
}