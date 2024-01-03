## Erc20 Token Swap Contract

This project contains a smart contract for swapping two ERC-20 tokens. The contract includes two ERC-20 token implementations, Bol token, and Sol token.

# Overview

The token swap contract facilitates the exchange of Bol tokens for Sol tokens and vice versa. The process involves deploying the individual ERC-20 tokens first, followed by the deployment of the token swap contract, which references the addresses of the deployed token contracts and the owner's address.

# Deployment

1. **Deploy Bol Token:**
   - Deploy the Bol token contract to the blockchain.

2. **Deploy Sol Token:**
   - Deploy the Sol token contract to the blockchain.

3. **Deploy Token Swap Contract:**
   - Deploy the token swap contract, providing the addresses of the Bol and Sol token contracts along with the owner's address as constructor arguments.

# Approval

After deploying the contracts, you need to grant approval for the token swap contract to spend a certain amount of Bol tokens and Sol tokens. This is achieved by calling the `approve` function on both ERC-20 token contracts:

1. **Approve Bol Token:**
   - Call the `approve` function on the Bol token contract, allowing the token swap contract to spend a specific amount of Bol tokens in wei.
  
2. **Approve Sol Token:**
   - Call the `approve` function on the Sol token contract, allowing the token swap contract to spend a specific amount of Bol tokens in wei.


## Token Swap

Once the approval is successful, you can execute the token swap by calling the swap function on the token swap contract:

**Swap Tokens:**
Call the swap function on the token swap contract to exchange Bol tokens for Sol tokens or vice versa.

 ```solidity
   // Example Solidity code for approving Bol tokens
  function swap(uint256 amount1, uint256 amount2) public {
        require(msg.sender == owner1 || msg.sender == owner2, "You are not allowed to swap");
        require(
            token1.allowance(owner1, address(this)) >= amount1,
            "Token 1 has not allowed or approved this amount"
        );
        require(
            token2.allowance(owner2, address(this)) >= amount2,
            "Token 2 has not allowed or approved this amount"
        );

        _safeTransferFrom(token1, owner1, owner2, amount1);
        _safeTransferFrom(token2, owner2, owner1, amount2);
    }
```

# Deployed Contracts

- **Bol smartcontract:** [Sepolia](https://sepolia.etherscan.io/address/0x02CF788e9c9460e4b8Ecd2E1a665dd2D31b353cC)
- **Sol smartcontract:** [Sepolia](https://sepolia.etherscan.io/address/0x7fCC11Ee6c36309AD2baFC8d1ba4f298b26FdFF4)
- **TokenSwap smartcontract:** [Sepolia](https://sepolia.etherscan.io/address/0x4D4B501f87441Fd1dBc602c94eB438010E54fAA4)



