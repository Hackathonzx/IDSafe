const { ethers } = require("hardhat");
const { expect } = require("chai");

let verificationOracle;
let user;
const chainlinkCCIPRouterAddress = "0xF694E193200268f9a4868e4Aa017A0118C9a8177"; // Placeholder for actual address

beforeEach(async function () {
  // Get the signers (accounts) from the ethers.js
  [user] = await ethers.getSigners();

  // Deploy the VerificationOracle contract
  const VerificationOracle = await ethers.getContractFactory("VerificationOracle");
  verificationOracle = await VerificationOracle.deploy();
  await verificationOracle.waitForDeployment();
});

describe("VerificationOracle", function () {

  it("Should set the Chainlink CCIP Router", async function () {
    // Set the Chainlink CCIP Router address (as a string, not an ENS name)
    await verificationOracle.setChainlinkCCIPRouter(chainlinkCCIPRouterAddress);

    // Verify that the Chainlink CCIP Router was correctly set
    expect(await verificationOracle.chainlinkCCIPRouter()).to.equal(chainlinkCCIPRouterAddress);
  });

  it("Should request cross-chain identity verification", async function () {
    // Issue a credential (assuming some user logic for credential issuance)
    await verificationOracle.issueCredentialWithMetadata(user.address, "metadata");

    // Request cross-chain identity verification
    await expect(verificationOracle.emitCrossChainVerificationEvent(0, "Avalanche"))
      .to.emit(verificationOracle, "IdentityVerifiedCrossChain")
      .withArgs(user.address, 0, "Avalanche");
  });

  it("Should fulfill a cross-chain verification request", async function () {
    // Issue a credential
    await verificationOracle.issueCredentialWithMetadata(user.address, "metadata");

    // Mock a cross-chain request and fulfill it (assuming requestID is 1, adjust accordingly)
    const requestId = ethers.utils.hexlify(ethers.utils.randomBytes(32)); // Generate random requestId as bytes32
    const successFlag = true; // Mock success
    const response = "0x01"; // Mock response as bytes

    // Fulfill the request
    await verificationOracle.fulfillVerificationRequest(requestId, successFlag, response);

    // Check the emitted event
    await expect(verificationOracle.fulfillVerificationRequest(requestId, successFlag, response))
      .to.emit(verificationOracle, "RequestFulfilled")
      .withArgs(requestId, successFlag, response);
  });

  it("Should emit RequestFulfilled event", async function () {
    // Issue a credential
    await verificationOracle.issueCredentialWithMetadata(user.address, "metadata");

    // Generate a mock cross-chain request ID and response
    const requestId = ethers.utils.hexlify(ethers.utils.randomBytes(32)); // bytes32 requestId
    const successFlag = true;
    const response = ethers.utils.hexlify(1); // '0x01'

    // Emit the RequestFulfilled event
    await expect(verificationOracle.fulfillVerificationRequest(requestId, successFlag, response))
      .to.emit(verificationOracle, "RequestFulfilled")
      .withArgs(requestId, successFlag, response);
  });

});
