// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "../openzeppelin2/npm/@openzeppelin/contracts@4.9.2/interfaces/IERC721.sol";
import "../openzeppelin2/npm/@openzeppelin/contracts@4.9.2/token/ERC721/extensions/ERC721URIStorage.sol";
import "../openzeppelin2/npm/@openzeppelin/contracts@4.9.2/token/ERC721/extensions/ERC721Burnable.sol";
import "../openzeppelin2/npm/@openzeppelin/contracts@4.9.2/access/Ownable.sol";
import "../openzeppelin2/npm/@openzeppelin/contracts@4.9.2/utils/Counters.sol";

contract MyToken is ERC721, ERC721URIStorage, ERC721Burnable, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("MyToken", "MTK") {}

    function safeMint(address to, string memory uri) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }

    // The following functions are overrides required by Solidity.

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}