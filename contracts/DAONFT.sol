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

    /***
     * @dev mint nft 
     * 
     * @param _uri is uri string of NFT
     * 
     * Only owner of NFT can call this function
     */
    function mint(string memory _uri) external onlyOwner {
        uint256 tokenId = getTokenCounter();

        require(tokenId <= totalSupply, "Reach limit total supply");
        
        // mint NFT
        _safeMint(msg.sender, tokenId);
        // set token URI
        _setTokenURI(tokenId, _uri);
    }

    /***
     * @dev get token id of NFT
     * 
     * Only call in contract
     */
    function getTokenCounter() internal returns (uint256) {
        tokenCounter = tokenCounter.add(1);
        return tokenCounter;
    }

}
