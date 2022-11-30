// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract transfer is ERC20, Ownable {
    constructor() ERC20("MyToken", "MTK") {}
    function mint(address to, uint256 amount) public payable {
        _mint(to, amount);
    }
    function sendEth(address payable _to) public payable {
        (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }
    function exchangeRI(address to, uint256 amount) public payable  {
        uint256 weiToEth = amount/10e18;
        uint256 value = (weiToEth * 1000 * 95)/100;
        _mint(to, value);
    }
}