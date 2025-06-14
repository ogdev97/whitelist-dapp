// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Whitelist {
    // Maximum number of whitelisted addresses
    uint256 public constant MAX_WHITELISTED_ADDRESSES = 10000;
    
    // Current number of whitelisted addresses
    uint256 public numAddressesWhitelisted;
    
    // Mapping to track whitelisted addresses
    mapping(address => bool) public whitelistedAddresses;
    
    // Events
    event AddressWhitelisted(address indexed account);
    event AddressRemovedFromWhitelist(address indexed account);
    
    // Modifier to check if the whitelist is not full
    modifier notFull() {
        require(numAddressesWhitelisted < MAX_WHITELISTED_ADDRESSES, "Whitelist is full");
        _;
    }
    
    // Add an address to the whitelist
    function addAddressToWhitelist() public notFull {
        require(!whitelistedAddresses[msg.sender], "Address already whitelisted");
        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted += 1;
        emit AddressWhitelisted(msg.sender);
    }
    
    // Remove an address from the whitelist
    function removeAddressFromWhitelist() public {
        require(whitelistedAddresses[msg.sender], "Address not whitelisted");
        whitelistedAddresses[msg.sender] = false;
        numAddressesWhitelisted -= 1;
        emit AddressRemovedFromWhitelist(msg.sender);
    }
    
    // Check if an address is whitelisted
    function isWhitelisted(address _address) public view returns (bool) {
        return whitelistedAddresses[_address];
    }
    
    // Get the current number of whitelisted addresses
    function getWhitelistedCount() public view returns (uint256) {
        return numAddressesWhitelisted;
    }
}
