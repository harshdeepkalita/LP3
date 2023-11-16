//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract BankAccount{
    mapping (address =>uint) public balances;
    address public owner;

    constructor(){
        owner = msg.sender;
        // this will be executed once 
        //here the owner is the person who is the main author/deployer of this smartcontract
    }
    function deposit() public payable {
        // condition given and if success then amount credited to the sender's account
        require(msg.value>0,"Deposit should be greater than 0");
        balances[msg.sender] = balances[msg.sender] + msg.value;
    }
    function withdraw(uint amount)public {
        //checking funds
        require(balances[msg.sender]>=amount, "insufficient funds");
        // payable() converts msg.sender to a payable address
        // tansfer() sends amount from smart contract balances to the payable address
        payable(msg.sender).transfer(amount);
        balances[msg.sender] -= amount;
    }
    // show balance
    function getBalance() public view returns(uint){
        return balances[msg.sender];
    }
}



