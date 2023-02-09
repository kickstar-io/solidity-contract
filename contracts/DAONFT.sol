// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract NFT is ERC721URIStorage, Ownable
{
    using SafeMath for uint256;
    uint256 tokenCounter;
    uint256 totalSupply;

    constructor(uint256 _totalSupply)  ERC721("The Space NFT", "TheSpaceNFT") {
        totalSupply = _totalSupply;
    }

    function mint(string memory _url) external onlyOwner {
        uint256 tokenId = getTokenCounter();

        require(tokenId <= totalSupply, "Reach limit total supply");
        
        // mint NFT
        _safeMint(msg.sender, tokenId);
        // set token URI
        _setTokenURI(tokenId, _url);
    }

    function getTokenCounter() internal returns (uint256) {
        tokenCounter = tokenCounter.add(1);
        return tokenCounter;
    }

}
