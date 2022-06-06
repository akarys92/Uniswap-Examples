const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Greeter", function () {
  it("Should return the new greeting once it's changed", async function () {
    const SwapExample = await ethers.getContractFactory("SwapExample");
    const swapRouterAddress = '0xE592427A0AEce92De3Edee1F18E0157C05861564';
    const swapRouter = await etherscan.getContract(swapRouterAddress);

    const SwapExampleContract = await SwapExample.deploy(swapRouter);

    await SwapExampleContract.deployed();

    
    console.log("Contract deployed to:", SwapExampleContract.address);

    // expect(await greeter.greet()).to.equal("Hello, world!");

    // const setGreetingTx = await greeter.setGreeting("Hola, mundo!");

    // // wait until the transaction is mined
    // await setGreetingTx.wait();

    // expect(await greeter.greet()).to.equal("Hola, mundo!");
  });
});
