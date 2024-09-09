const { ethers } = require("hardhat");
require('dotenv').config();

async function main() {
    const [deployer] = await ethers.getSigners();
    
    console.log("Deploying contracts with the account:", deployer.address);

    // Deploy DIDRegistry contract
    const DIDRegistry = await ethers.getContractFactory("DIDRegistry");
    const didRegistry = await DIDRegistry.deploy();
    await didRegistry.deployed();
    console.log("DIDRegistry deployed to:", didRegistry.address);

    // Deploy CredentialNFT contract
    const CredentialNFT = await ethers.getContractFactory("CredentialNFT");
    const credentialNFT = await CredentialNFT.deploy();
    await credentialNFT.deployed();
    console.log("CredentialNFT deployed to:", credentialNFT.address);

    // Deploy VerificationOracle contract
    const VerificationOracle = await ethers.getContractFactory("VerificationOracle");
    const ccipRouter = process.env.CCIP_ROUTER_ADDRESS; // Set this in your .env file
    const linkToken = process.env.LINK_TOKEN_ADDRESS; // Set this in your .env file
    const verificationOracle = await VerificationOracle.deploy(ccipRouter, linkToken);
    await verificationOracle.deployed();
    console.log("VerificationOracle deployed to:", verificationOracle.address);
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});