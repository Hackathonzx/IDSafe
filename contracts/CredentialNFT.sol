// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";  // Importing the Counters library

contract CredentialNFT is ERC721, Ownable {
    using Counters for Counters.Counter;  // Correct usage of Counters
    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("CredentialNFT", "CRDNTL") {}

    event CredentialIssued(address indexed to, uint256 tokenId);

    function issueCredential(address to) external onlyOwner {
        uint256 newTokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        
        _mint(to, newTokenId);
        emit CredentialIssued(to, newTokenId);
    }

    function burnCredential(uint256 tokenId) external {
        require(ownerOf(tokenId) == msg.sender, "Not the credential owner");
        _burn(tokenId);
    }
}
