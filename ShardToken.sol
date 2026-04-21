// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ShardToken is ERC20 {
    address public immutable vault;

    constructor(
        string memory _name, 
        string memory _symbol, 
        uint256 _supply, 
        address _to
    ) ERC20(_name, _symbol) {
        vault = msg.sender;
        _mint(_to, _supply * 10**decimals());
    }
}
