// require("@nomiclabs/hardhat-waffle");
// require("@nomiclabs/hardhat-ethers");
require("@nomiclabs/hardhat-ethers");
require("dotenv").config();

const { RPC_URL, PRIVATE_KEY } = process.env

module.exports = {
  solidity: "0.8.24",
  networks: {
    IntersectTestnet: {
      url: process.env.AVALANCHE_URL,
      chainId: 1612,
      accounts: [process.env.PRIVATE_KEY],
    },
  },
};