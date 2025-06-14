const hre = require("hardhat");

async function main() {
  console.log("Deploying Whitelist contract...");

  // Get the contract factory
  const Whitelist = await hre.ethers.getContractFactory("Whitelist");

  // Deploy the contract
  const whitelist = await Whitelist.deploy();

  // Wait for deployment to finish
  await whitelist.waitForDeployment();

  // Get the contract address
  const whitelistAddress = await whitelist.getAddress();

  console.log("Whitelist contract deployed to:", whitelistAddress);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
