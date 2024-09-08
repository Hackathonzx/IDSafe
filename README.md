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

VerificationOracle.sol: This contract will use Chainlink to communicate with off-chain data or credential databases for verification purposes.


link to the verified contract on the Arbitrum explorer: https://sepolia.arbiscan.io/address/0x2fad953e1f524e6590edf50bda6fcb391dd4fd96