// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

// We first import some OpenZeppelin Contracts.
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

// We inherit the contract we imported. This means we'll have access
// to the inherited contract's methods.
contract MyEpicNFT is ERC721URIStorage {
  // Magic given to us by OpenZeppelin to help us keep track of tokenIds.
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  // We need to pass the name of our NFTs token and it's symbol.
  constructor() ERC721 ("SquareNFT", "SQUARE") {
    console.log("This is my NFT contract. Woah!");
  }

  // A function our user will hit to get their NFT.
  function makeAnEpicNFT() public {
     // Get the current tokenId, this starts at 0.
    uint256 newItemId = _tokenIds.current();

     // Actually mint the NFT to the sender using msg.sender.
    _safeMint(msg.sender, newItemId);

    // Set the NFTs data.
    _setTokenURI(newItemId, "data:application/json;base64,eyJuYW1lIjoiVGV4dCBpbiBzcXVhcmUiLCJkZXNjcmlwdGlvbiI6IlRleHQgaW4gc3F1YXJlIiwiaW1hZ2UiOiJkYXRhOmltYWdlL3N2Zyt4bWw7YmFzZTY0LENqeHpkbWNnZUcxc2JuTTlJbWgwZEhBNkx5OTNkM2N1ZHpNdWIzSm5Mekl3TURBdmMzWm5JaUJ3Y21WelpYSjJaVUZ6Y0dWamRGSmhkR2x2UFNKNFRXbHVXVTFwYmlCdFpXVjBJaUIyYVdWM1FtOTRQU0l3SURBZ016VXdJRE0xTUNJK0NpQWdJQ0E4YzNSNWJHVStMbUpoYzJVZ2V5Qm1hV3hzT2lCaWJHRmphenNnWm05dWRDMW1ZVzFwYkhrNklITmxjbWxtT3lCbWIyNTBMWE5wZW1VNklERTBjSGc3SUgwOEwzTjBlV3hsUGdvZ0lDQWdQSEpsWTNRZ2QybGtkR2c5SWpFd01DVWlJR2hsYVdkb2REMGlNVEF3SlNJZ1ptbHNiRDBpY0dsdWF5SWdMejRLSUNBZ0lEeDBaWGgwSUhnOUlqVXdKU0lnZVQwaU5UQWxJaUJqYkdGemN6MGlZbUZ6WlNJZ1pHOXRhVzVoYm5RdFltRnpaV3hwYm1VOUltMXBaR1JzWlNJZ2RHVjRkQzFoYm1Ob2IzSTlJbTFwWkdSc1pTSStTRzkwVTJGMVkyVklaWEpoYkdROEwzUmxlSFErQ2p3dmMzWm5QZ289In0=");

    console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);

    // Increment the counter for when the next NFT is minted.
    _tokenIds.increment();
  }
}
