// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin-contracts/contracts/utils/cryptography/MerkleProof.sol";

contract MftMerkle is ERC721, ERC721Burnable, Ownable {
    constructor() ERC721("Nft Merkle", "NMK") {}

    function _baseURI() internal pure override returns (string memory) {
        return "baseuri.com";
    }



    function safeMint(address to, uint256 tokenId) public onlyOwner {
        _safeMint(to, tokenId);
    }
}
