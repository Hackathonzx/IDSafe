# Project Name: IDSafe
# Overview
IDSafe is a blockchain-based identity verification system designed for refugees. It uses decentralized identifiers (DIDs) and Chainlink's Cross-Chain Interoperability Protocol (CCIP) to manage identity verification across different blockchains. The system ensures that refugees can access essential services like healthcare, education, and financial assistance through verified digital credentials.

# Features
- Decentralized Identity Management: Each refugee is assigned a unique Decentralized Identifier (DID) to manage their identity securely.
- Cross-Chain Interoperability: Integration with Chainlink CCIP allows for seamless identity verification across multiple blockchain networks.
- Credential Issuance and Verification: Refugees receive verifiable credentials as NFTs or tokens, which can be used to prove their identity.
- Event Emission: The system emits events for credential issuance and cross-chain verification, ensuring transparency and traceability.

# Architecture
# Smart Contracts:
- DIDRegistry.sol: Manages the registration and retrieval of DIDs.
- VerificationOracle.sol: Handles cross-chain verification requests using Chainlink CCIP.
- CredentialNFT.sol: Issues and manages credentials as ERC721 NFTs.

# Deployment
Network: IntersectTestnet, Intersect network on Avalanche.
# Contract Addresses:
- DIDRegistry: [0x41CD3d7753eeAD4c2d384a6C0074eA4c27dE36F1]
- VerificationOracle: [0xf1979Ac32D086D1f3f3773fe0828d37729ed545f]
- CredentialNFT: [0x1d8c981FD95060A45b3Cea346DbF7b5b48f5CD36]

# Setup and Installation
# Clone the Repository:  git clone https://github.com/yourusername/idsafe.git

# Install Dependencies:
cd idsafe
npm install

# Run Tests:
npx hardhat test

# Deploy Contracts:
Edit deploy.js with your network settings.
Run deployment script:
npx hardhat run scripts/deploy.js --network [network-name]

# Usage
- Issuing Credentials:
Call issueCredentialWithMetadata(to: address, metadata: string) on the CredentialNFT contract.

- Verifying Credentials:
Use getCredentialMetadata(tokenId: uint256) to retrieve metadata.

- Cross-Chain Verification:
Call emitCrossChainVerificationEvent(tokenId: uint256, chain: string) to emit verification events.

# Testing
- Test Framework: Hardhat
- Tests: [Test files]
- test/CredentialNFT.test.js: Tests for the CredentialNFT contract.
- test/DIDRegistry.test.js: Tests for the DIDRegistry contract.
- test/VerificationOracle.test.js: Tests for the VerificationOracle contract.

# Contributing
- Fork the Repository:
- Create a New Branch:
git checkout -b feature/your-feature
- Make Changes and Commit:
git add .
git commit -m "Add feature"
- Push Changes:
git push origin feature/your-feature

# License
[Specify License]

Acknowledgments
[List any libraries, tools, or people that contributed to the project.]



jobId = "8ced832954544a3c98543c94a51d6a8d";


link to the verified contract on the Arbitrum explorer: https://sepolia.arbiscan.io/address/0x2fad953e1f524e6590edf50bda6fcb391dd4fd96