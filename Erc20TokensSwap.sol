// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";




contract BolToken is ERC20 {
    constructor() ERC20("BolToken", "BTK") {
        _mint(msg.sender, 100e18);
    }

    
}

contract SolToken is ERC20 {
    constructor() ERC20("SolToken", "STK") {
        _mint(msg.sender, 50e18);
    }
}


contract TokenSwap {
    IERC20 public token1;
    address public owner1;
    IERC20 public token2;
    address public owner2;

    constructor(
        address _token1, 
        address _owner1,
        address _token2,
        address _owner2
    ) {
        token1 = IERC20(_token1);
        owner1 = _owner1;
        token2 = IERC20(_token2);
        owner2 = _owner2;
    }
    

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

    function _safeTransferFrom(
        IERC20 token,
        address sender,
        address recipient,
        uint amount
    ) private {
        bool sent = token.transferFrom(sender, recipient, amount);
        require(sent, "Token transfer failed");
    }
}
