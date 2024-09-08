// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract VerificationOracle is ChainlinkClient, Ownable {
    using Chainlink for Chainlink.Request;

    // Chainlink Oracle configuration
    address private oracle;  // Chainlink Oracle address
    bytes32 private jobId;   // Job ID to specify the task
    uint256 private fee;     // Chainlink fee (LINK)

    // Response data
    uint256 public response;

    // Events
    event RequestFulfilled(bytes32 indexed requestId, uint256 indexed data);

    constructor() {
        // Initialize with Chainlink token address on the testnet
        _setChainlinkToken(0x0b9d5D9136855f6FEc3c0993feE6E9CE8a297846);  // LINK token address (Testnet)
        setOracleAddress(0xd0EbC86a4f67654B654Feb0e615d7f5C139a6406);  // Oracle address
        setJobId("8ced832954544a3c98543c94a51d6a8d");   // Job ID for Chainlink
        setFeeInHundredthsOfLink(0);  // Setting fee to 0 LINK
    }

    // Request cross-chain data related to user identity verification
    function requestIdentityVerificationData(string memory did) public {
        Chainlink.Request memory req = _buildChainlinkRequest(jobId, address(this), this.fulfill.selector);
        
        // Construct URL for the mock API
        string memory url = string(abi.encodePacked("https://api.mockaroo.com/api/1395ac80?count=50&key=ec41c190"));

        // Add URL and parameters to the request
        req._add("get", url);
        req._add("path", string(abi.encodePacked("issuer,", did, ",verified")));  // Adjust path based on actual API response

        // Send request to Chainlink oracle
        _sendChainlinkRequestTo(oracle, req, fee);
    }

    // Function to fulfill the request from Chainlink oracle
    function fulfill(bytes32 _requestId, uint256 _identityData) public recordChainlinkFulfillment(_requestId) {
        response = _identityData;  // Process the cross-chain identity verification data
        emit RequestFulfilled(_requestId, _identityData);  // Emit event with received data
    }

    // Setters for updating contract parameters (can be restricted with onlyOwner in the future)

    // Update oracle address
    function setOracleAddress(address _oracleAddress) public onlyOwner {
        oracle = _oracleAddress;
        _setChainlinkOracle(_oracleAddress);
    }

    // Update job ID for Chainlink request
    function setJobId(string memory _jobId) public onlyOwner {
        jobId = bytes32(bytes(_jobId));
    }

    // Set Chainlink request fee in LINK
    function setFeeInHundredthsOfLink(uint256 _feeInHundredthsOfLink) public onlyOwner {
        fee = (_feeInHundredthsOfLink * 10 ** 18) / 100;  // Fee calculated in Juels
    }

    // Withdraw LINK tokens from the contract (for the contract owner)
    function withdrawLink() public onlyOwner {
        LinkTokenInterface link = LinkTokenInterface(_chainlinkTokenAddress());
        require(link.transfer(msg.sender, link.balanceOf(address(this))), "Unable to transfer");
    }
}
