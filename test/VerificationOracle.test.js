const { ethers } = require("hardhat");
const { expect } = require("chai");

let verificationOracle;
let user;
const chainlinkCCIPRouterAddress = "0xF694E193200268f9a4868e4Aa017A0118C9a8177"; // Placeholder for actual address

beforeEach(async function () {
  // Get the signers (accounts) from ethers.js
  [user] = await ethers.getSigners();

  // Deploy the VerificationOracle contract
  const VerificationOracle = await ethers.getContractFactory("VerificationOracle");
  verificationOracle = await VerificationOracle.deploy(chainlinkCCIPRouterAddress, "0xYourLinkTokenAddress");
  await verificationOracle.deployed();
});

describe("VerificationOracle", function () {

  it("Should set the Chainlink CCIP Router", async function () {
    // Set the Chainlink CCIP Router address
    await verificationOracle.setCcipRouter(chainlinkCCIPRouterAddress);

    // Verify that the Chainlink CCIP Router was correctly set
    expect(await verificationOracle.ccipRouter()).to.equal(chainlinkCCIPRouterAddress);
  });

  it("Should request cross-chain identity verification", async function () {
    // Request cross-chain identity verification
    await expect(verificationOracle.requestCrossChainIdentityVerification(0, "did:example:123", "Avalanche"))
      .to.emit(verificationOracle, "CrossChainVerificationRequest")
      .withArgs(0, user.address, "Avalanche");
  });

  it("Should fulfill a cross-chain verification request", async function () {
    // Mock a cross-chain request and fulfill it
    const requestId = ethers.utils.hexlify(ethers.utils.randomBytes(32)); // Generate random requestId as bytes32
    const identityData = 12345; // Mock identity data

    // Fulfill the request
    await verificationOracle.fulfill(requestId, identityData);

    // Check the emitted event
    await expect(verificationOracle.fulfill(requestId, identityData))
      .to.emit(verificationOracle, "RequestFulfilled")
      .withArgs(requestId, identityData);
  });

  it("Should emit RequestFulfilled event", async function () {
    // Generate a mock cross-chain request ID and response
    const requestId = ethers.utils.hexlify(ethers.utils.randomBytes(32)); // bytes32 requestId
    const identityData = 12345; // Mock identity data

    // Emit the RequestFulfilled event
    await expect(verificationOracle.fulfill(requestId, identityData))
      .to.emit(verificationOracle, "RequestFulfilled")
      .withArgs(requestId, identityData);
  });

});