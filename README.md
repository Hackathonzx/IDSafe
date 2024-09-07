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

## IDSafe.sol: This is the primary contract handling identity registration, verification, and management.
Responsibilities:
Register and manage identities.
Link Web2 identifiers.
Verify identities.
Recover identities based on Web2 identifiers.
Emit relevant events.

EncryptionUtils.sol: 

## CrossChainIntegration.sol: 
Responsibilities:
Send and receive cross-chain messages.
Integrate with Chainlink CCIP or other cross-chain solutions.
Handle cross-chain data securely.


link to the verified contract on the Arbitrum explorer: https://sepolia.arbiscan.io/address/0x2fad953e1f524e6590edf50bda6fcb391dd4fd96