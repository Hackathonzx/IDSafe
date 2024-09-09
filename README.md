# Sample Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, and a Hardhat Ignition module that deploys that contract.

Try running some of the following tasks:

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat ignition deploy ./ignition/modules/Lock.js
```
contracts files created:
DIDRegistry.sol: This contract will handle the creation and management of Decentralized Identifiers (DIDs) for refugees.

CredentialNFT.sol: This contract will handle the issuance of credentials as NFTs, verified and credentialed by UNHCR.

### VerificationOracle.sol: 
Utilizes Chainlink's CCIP Router to handle cross-chain communication for identity verification. It allows you to request verification data from different chains and process the responses. This is key for interoperability and ensures that the verification process works across different blockchain networks.

### DIDRegistry.sol: 
Handles the registration and management of Decentralized Identifiers (DIDs), which is crucial for linking identities in a decentralized system.

### CredentialNFT.sol: 
Manages ERC721 NFTs representing credentials, which can be issued, queried, and burned. This supports the identity verification process by providing a way to issue and manage credentials on-chain.

integrating Chainlink CCIP
This contract is responsible for handling requests and responses, which makes it a suitable candidate for incorporating cross-chain functionalities.
smart contract to handle cross-chain requests and responses using CCIP
 purpose of this contract is to request identity verification across multiple blockchains, rather than requesting data from an external API.


jobId = "8ced832954544a3c98543c94a51d6a8d";

link to the verified contract on the Arbitrum explorer: https://sepolia.arbiscan.io/address/0x2fad953e1f524e6590edf50bda6fcb391dd4fd96