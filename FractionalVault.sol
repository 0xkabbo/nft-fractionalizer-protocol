// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./ShardToken.sol";

contract FractionalVault {
    uint256 public vaultCount;

    struct Vault {
        address owner;
        address nftAddress;
        uint256 tokenId;
        address shardAddress;
        bool active;
    }

    mapping(uint256 => Vault) public vaults;

    function fractionalize(
        address _nftAddress, 
        uint256 _tokenId, 
        string memory _name, 
        string memory _symbol, 
        uint256 _supply
    ) external {
        IERC721(_nftAddress).transferFrom(msg.sender, address(this), _tokenId);

        ShardToken newShard = new ShardToken(_name, _symbol, _supply, msg.sender);

        vaults[vaultCount] = Vault({
            owner: msg.sender,
            nftAddress: _nftAddress,
            tokenId: _tokenId,
            shardAddress: address(newShard),
            active: true
        });

        vaultCount++;
    }

    function redeem(uint256 _vaultId) external {
        Vault storage v = vaults[_vaultId];
        require(v.active, "Vault not active");
        
        uint256 supply = IERC20(v.shardAddress).totalSupply();
        require(IERC20(v.shardAddress).balanceOf(msg.sender) == supply, "Must own all shards");

        v.active = false;
        IERC721(v.nftAddress).transferFrom(address(this), msg.sender, v.tokenId);
    }
}
