const { ethers } = require("hardhat");
require('dotenv').config();

async function main() {
    const [deployer] = await ethers.getSigners();
    
    console.log("Deploying contracts with the account:", deployer.address);

    // Deploy DIDRegistry contract
    const DIDRegistry = await ethers.getContractFactory("DIDRegistry");
    const didRegistry = await DIDRegistry.deploy();
    await didRegistry.waitForDeployment(); // Updated for ethers v6
    console.log("DIDRegistry deployed to:", await didRegistry.getAddress()); // Updated for ethers v6

    // Deploy CredentialNFT contract
    const CredentialNFT = await ethers.getContractFactory("CredentialNFT");
    const credentialNFT = await CredentialNFT.deploy();
    await credentialNFT.waitForDeployment();
    console.log("CredentialNFT deployed to:", await credentialNFT.getAddress());

    // Deploy VerificationOracle contract
    const VerificationOracle = await ethers.getContractFactory("VerificationOracle");
    const ccipRouter = process.env.CCIP_ROUTER_ADDRESS; // this is Set in the .env file
    const linkToken = process.env.LINK_TOKEN_ADDRESS; // this is Set in the .env file
    const verificationOracle = await VerificationOracle.deploy(ccipRouter, linkToken);
    await verificationOracle.waitForDeployment(); // Updated for ethers v6
    console.log("VerificationOracle deployed to:", await verificationOracle.getAddress()); // Updated for ethers v6
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
