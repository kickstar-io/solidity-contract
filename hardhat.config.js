// require("@nomicfoundation/hardhat-toolbox");
require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-etherscan");
require("hardhat-gas-reporter");
require('hardhat-abi-exporter');
require("dotenv").config();

const settings = {
  optimizer: {
    enabled: true,
    runs: 200,
  },
};

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: {
    compilers: [
      { version: '0.8.17', settings },
      { version: '0.8.7', settings }
    ],
  },
  networks: {
    bscTestnet: {
      url: "https://data-seed-prebsc-1-s1.binance.org:8545/",
      accounts: process.env.PRIVATE_KEY_TESTNET !== undefined
      ? [process.env.PRIVATE_KEY_TESTNET]
      : [],
      chainId: 97,
    },
    mumbai: {
      url: "https://rpc-mumbai.maticvigil.com/",
      accounts: process.env.PRIVATE_KEY_TESTNET !== undefined
      ? [process.env.PRIVATE_KEY_TESTNET]
      : [],
    },
    bsc: {
      url: "https://bsc-dataseed.binance.org/",
      accounts: process.env.PRIVATE_KEY !== undefined
      ? [process.env.PRIVATE_KEY]
      : [],
      chainId: 56,
    },
  },
  abiExporter: {
    path: "./abi",
    pretty: true,
    flat: false,
  },
  paths: {
    artifacts: "artifacts",
    cache: "cache",
    deploy: "deploy",
    deployments: "deployments",
    imports: "imports",
    sources: "contracts",
    tests: "test",
  },
  gasReporter: {
    enabled: process.env.REPORT_GAS !== undefined,
    currency: "USD",
  },
  etherscan: {
    apiKey: process.env.ETHERSCAN_KEY,
  },
};