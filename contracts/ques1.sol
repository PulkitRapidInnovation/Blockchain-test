// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract InsuranceCompany{
address admin;
mapping(address => uint) customer;
bool flightDelay = false;
uint256 totalInsuranceMoney;
 constructor(){
    admin = msg.sender;
    
 }

    function setInsuranceMoney(uint256 _totalInsuranceMoney) public{
        require(msg.sender == admin,"Access restriced.");
        totalInsuranceMoney = _totalInsuranceMoney;
    }

    function addReserves() public payable returns (string memory){
         require(msg.sender == admin,"Access restriced.");
         return "Amount recieved";
    }


    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    function customerDeposit() public payable returns (string memory )
{
    require(msg.sender == admin,"Access restriced.");
       customer[msg.sender] = msg.value;
       return "Amount recieved";
}

    function updateFlightInformation(bool _value) public{
        require(msg.sender == admin,"Access restriced.");
        flightDelay = _value;
    }

    function getInsuranceMoney() public  returns(string memory){
        require(msg.sender == admin,"Access restriced.");
        uint Amount;
        address payable insurer = payable(msg.sender);
        if(flightDelay) {
            if(customer[insurer] > 0){
            Amount = customer[insurer] + totalInsuranceMoney;
            insurer.transfer(Amount);
              return "Amount transfered";
            }
            return "Not an insurer.";
        }
        return "Flight is not deplayed";
    }

}