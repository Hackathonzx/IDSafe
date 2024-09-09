const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("VerificationOracle", function () {
    let VerificationOracle, verificationOracle, owner, user;
    const mockRouterAddress = "process.env.CCIP_ROUTER_ADDRESS";
    const mockLinkToken = "process.env.LINK_TOKEN_ADDRESS";

    beforeEach(async function () {
        [owner, user] = await ethers.getSigners();
        const VerificationOracle = await ethers.getContractFactory("VerificationOracle");
        verificationOracle = await VerificationOracle.deploy(mockRouterAddress, mockLinkToken);
        await verificationOracle.deployed();
    });

    it("Should set the Chainlink CCIP Router", async function () {
        await verificationOracle.setCcipRouter("process.env.CCIP_ROUTER_ADDRESS");
        expect(await verificationOracle.ccipRouter()).to.equal("process.env.CCIP_ROUTER_ADDRESS");
    });

    it("Should request cross-chain identity verification", async function () {
        await expect(verificationOracle.requestCrossChainIdentityVerification(0, "did:example:123", "Avalanche"))
            .to.emit(verificationOracle, "CrossChainVerificationRequest")
            .withArgs(0, owner.address, "Avalanche");
    });

    it("Should fulfill a cross-chain verification request", async function () {
        // Mock Chainlink fulfill response
        await verificationOracle.fulfill("0x1", 12345);
        expect(await verificationOracle.response()).to.equal(12345);
    });

    it("Should emit RequestFulfilled event", async function () {
        await expect(verificationOracle.fulfill("0x1", 12345))
            .to.emit(verificationOracle, "RequestFulfilled")
            .withArgs("0x1", 12345);
    });
});
