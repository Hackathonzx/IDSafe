// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract VerificationOracle is ChainlinkClient, Ownable {
    using Chainlink for Chainlink.Request;

    address private ccipRouter;  // Chainlink CCIP Router address
    bytes32 private jobId;        // Job ID for Chainlink CCIP task
    uint256 private fee;          // Chainlink fee (in LINK)

    // Response data
    uint256 public response;

    // Events
    event RequestFulfilled(bytes32 indexed requestId, uint256 indexed data);
    event CrossChainVerificationRequest(uint256 tokenId, address requester, string destinationChain);

    constructor(address _ccipRouter, address _linkToken) {
        _setChainlinkToken(_linkToken);  // Set Chainlink LINK token address
        ccipRouter = _ccipRouter;      // Set CCIP Router address
        jobId = "8ced832954544a3c98543c94a51d6a8d";            // Set your Chainlink job ID
        fee = 0;                          // Set Chainlink fee for testing
    }

    // Request cross-chain identity verification using the CCIP Router
    function requestCrossChainIdentityVerification(uint256 tokenId, string memory did, string memory destinationChain) public {
        Chainlink.Request memory req = _buildChainlinkRequest(jobId, address(this), this.fulfill.selector);

        req._add("did", did);  // Decentralized Identifier (DID)
        req._add("destinationChain", destinationChain);  // Destination blockchain

        _sendChainlinkRequestTo(ccipRouter, req, fee);  // Send request via Chainlink Router (Transporter)
        emit CrossChainVerificationRequest(tokenId, msg.sender, destinationChain);
    }

    // Fulfill cross-chain data from CCIP
    function fulfill(bytes32 _requestId, uint256 _identityData) public recordChainlinkFulfillment(_requestId) {
        response = _identityData;
        emit RequestFulfilled(_requestId, _identityData);
    }

    // Setter for dynamically updating the CCIP Router address
    function setCcipRouter(address _ccipRouter) public onlyOwner {
        ccipRouter = _ccipRouter;
    }

    // Setter for updating the Chainlink job ID
    function setJobId(bytes32 _jobId) public onlyOwner {
        jobId = _jobId;
    }

    // Setter for updating the Chainlink fee
    function setFee(uint256 _fee) public onlyOwner {
        fee = _fee;
    }

    // Withdraw LINK tokens
    function withdrawLink() public onlyOwner {
        LinkTokenInterface link = LinkTokenInterface(_chainlinkTokenAddress());
        require(link.transfer(msg.sender, link.balanceOf(address(this))), "Unable to transfer");
    }
}