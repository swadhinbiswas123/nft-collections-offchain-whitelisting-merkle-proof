// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";

contract MftMerkle is ERC721, ERC721Burnable, Ownable {
    bytes32 root;

    constructor(bytes32 _root) ERC721("Nft Merkle", "NMK") {
        root = _root;
    }

    function _baseURI() internal pure override returns (string memory) {
        return "baseuri.com";
    }

    function isWhitelisted(bytes32[] memory proof, bytes32 leaf) public view returns(bool){
       return MerkleProof.verify(proof, root, leaf);
    }

    function changeRoot(bytes32 _newRoot)  public onlyOwner{
        root = _newRoot;
    }

    function safeMint(address to, uint256 tokenId, bytes32[] memory proof, bytes32 leaf) public onlyOwner {
        require(isWhitelisted(proof, leaf), "Not a whitelisted member");
        _safeMint(to, tokenId);
    }
}
