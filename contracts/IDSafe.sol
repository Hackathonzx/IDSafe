// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract IDSafe is Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _identityIdCounter;

    struct Identity {
        uint256 id;
        address user;
        string web2Identifier;
        bool isVerified;
    }

    mapping(uint256 => Identity) public identities;
    mapping(address => uint256) public userToIdentity;
    mapping(string => uint256[]) public web2ToIdentities;

    event IdentityRegistered(address indexed user, uint256 identityId);
    event IdentityVerified(uint256 identityId);
    event IdentityRecovered(address indexed user, uint256 identityId);

    function registerIdentity(string calldata web2Identifier) external {
        require(userToIdentity[msg.sender] == 0, "Identity already registered");
        
        uint256 newIdentityId = _identityIdCounter.current();
        _identityIdCounter.increment();

        identities[newIdentityId] = Identity({
            id: newIdentityId,
            user: msg.sender,
            web2Identifier: web2Identifier,
            isVerified: false
        });
        
        userToIdentity[msg.sender] = newIdentityId;
        web2ToIdentities[web2Identifier].push(newIdentityId);

        emit IdentityRegistered(msg.sender, newIdentityId);
    }

    function verifyIdentity(uint256 identityId) external onlyOwner {
        Identity storage identity = identities[identityId];
        require(identity.id == identityId, "Invalid identity ID");
        require(!identity.isVerified, "Identity already verified");

        identity.isVerified = true;

        emit IdentityVerified(identityId);
    }

    function recoverIdentity(string calldata web2Identifier) external {
        uint256[] memory ids = web2ToIdentities[web2Identifier];
        require(ids.length > 0, "No identities found for the given Web2 identifier");

        uint256 identityId = ids[0];
        Identity storage identity = identities[identityId];
        require(identity.user == address(0), "Identity already linked");

        identity.user = msg.sender;

        emit IdentityRecovered(msg.sender, identityId);
    }

    function getIdentity(uint256 identityId) external view returns (Identity memory) {
        require(identities[identityId].id == identityId, "Invalid identity ID");
        return identities[identityId];
    }

    function getWeb2Identities(string calldata web2Identifier) external view returns (uint256[] memory) {
        return web2ToIdentities[web2Identifier];
    }
}
