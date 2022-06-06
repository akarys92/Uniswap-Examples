// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.7.0;
pragma abicoder v2;
import "hardhat/console.sol"; 

import '@uniswap/v3-periphery/contracts/interfaces/ISwapRouter.sol';
import '@uniswap/v3-periphery/contracts/libraries/TransferHelper.sol';

contract SwapExample {
    ISwapRouter public immutable swapRouter; 

    // Set addresses for mainnet
    address public constant DAI = 0x6B175474E89094C44Da98b954EedeAC495271d0F; 
    address public constant WETH9 = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2; 
    address public constant USDC = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48; 

    uint24 public constant poolFee = 3000; 

    constructor(ISwapRouter _router ) {
        swapRouter = _router; 
    }

    function swapExactInputSingle(uint256 amountIn) external returns (uint256 amountOut) {
        console.log("hello");
        // Transfer the amount of WETH9 to the contract
        TransferHelper.safeTransferFrom(WETH9, msg.sender, address(this), amountIn);

        // Approve the router to spend the WETH9
        TransferHelper.safeApprove(WETH9, address(swapRouter), amountIn);

        ISwapRouter.ExactInputSingleParams memory params = 
            ISwapRouter.ExactInputSingleParams({
                tokenIn: WETH9,
                tokenOut: DAI,
                fee: poolFee,
                recipient: msg.sender,
                deadline: block.timestamp,
                amountIn: amountIn,
                amountOutMinimum: 0,
                sqrtPriceLimitX96: 0
            });
        amountOut = swapRouter.exactInputSingle(params);
    }
}