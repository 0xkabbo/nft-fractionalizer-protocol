# NFT Fractionalizer Protocol

This repository implements a professional NFT fractionalization engine. It allows high-value NFTs to be "sharded" into millions of ERC20 tokens, making expensive digital assets accessible to smaller investors.

### Protocol Workflow
1. **Lock:** An NFT owner deposits an ERC721 token into the `FractionalVault`.
2. **Shard:** The contract mints a fixed supply of ERC20 "shards" representing 100% ownership of the locked NFT.
3. **Trade:** Shards can be traded on standard DEXs like Uniswap.
4. **Buyout:** A user can initiate a buyout by depositing enough shards or ETH to trigger an auction to unlock the original NFT.

### Technical Stack
* **Solidity ^0.8.20**
* **OpenZeppelin** ERC721 and ERC20 standards.
* **Flat Structure:** All logic contained in the root for easy deployment and auditing.
