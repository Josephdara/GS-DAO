// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract FNM {
    mapping(uint256 => address) public tokens;
    uint256 nftPrice = 0.01 ether;

    function purchase(uint256 tokenID) external payable {
        require(msg.value == nftPrice, "Costs 0.01 ETH");
        tokens[tokenID] = msg.sender;
    }

    function getPrice() external view returns (uint256){
        return nftPrice;
    }

    function available(uint256 tokenID) external view returns (bool){
        if (tokens[tokenID] == address(0)){
            return true;
        }
        return false;
    }
}