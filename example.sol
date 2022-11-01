// SPDX-License-Identifier: Unlicensed
// Developer - ReservedSnow(https://linktr.ee/reservedsnow)

// imports required
import '@openzeppelin/contracts/security/ReentrancyGuard.sol';
import '@openzeppelin/contracts/access/Ownable.sol';

pragma solidity >=0.8.17 <0.9.0;

contract SnowSplit is Ownable, ReentrancyGuard {

// wallet defined (will be able to change later using set functions incase of compromising of wallet or something)
address PayeeWallet1 = 0x119a5a09526Ff53E26fF641D64D0d993CFf107c1; // replace with the actual wallet address
address PayeeWallet2 = 0x119a5a09526Ff53E26fF641D64D0d993CFf107c1; // replace with the actual wallet address
address PayeeWallet3 = 0x119a5a09526Ff53E26fF641D64D0d993CFf107c1; // replace with the actual wallet address
address PayeeWallet4 = 0x119a5a09526Ff53E26fF641D64D0d993CFf107c1; // replace with the actual wallet address
address PayeeWallet5 = 0x119a5a09526Ff53E26fF641D64D0d993CFf107c1; // replace with the actual wallet address
address PayeeWallet6 = 0x119a5a09526Ff53E26fF641D64D0d993CFf107c1; // replace with the actual wallet address



// set functions 

// change all at once
  function setPayeeAddresses(address _address1, address _address2, address _address3, address _address4, address _address5, address _address6 ) public onlyOwner{
    PayeeWallet1 = _address1;
    PayeeWallet2 = _address2; 
    PayeeWallet3 = _address3;
    PayeeWallet4 = _address4;
    PayeeWallet5 = _address5;
    PayeeWallet6 = _address6;
  }

// change specific wallet 
  
  function setPayeeWallet1(address _address) public onlyOwner {
      PayeeWallet1 = _address;
  }

  function setPayeeWallet2(address _address) public onlyOwner {
      PayeeWallet2 = _address;
  }

  function setPayeeWallet3(address _address) public onlyOwner {
      PayeeWallet3 = _address;
  }

  function setPayeeWallet4(address _address) public onlyOwner {
      PayeeWallet4 = _address;
  }

  function setPayeeWallet5(address _address) public onlyOwner {
      PayeeWallet5 = _address;
  }

  function setPayeeWallet6(address _address) public onlyOwner {
      PayeeWallet6 = _address;
  }

//   withdraw func basic one example 

  function withdraw() public onlyOwner nonReentrant {
        uint _balance = address(this).balance;
        payable(PayeeWallet1).transfer(_balance * 15 / 100); // 15/ 100 means 15% of the current contract balance
        payable(PayeeWallet2).transfer(_balance * 15 / 100); // 15/ 100 means 15% of the current contract balance
        payable(PayeeWallet3).transfer(_balance * 15 / 100); // 15/ 100 means 15% of the current contract balance
        payable(PayeeWallet4).transfer(_balance * 15 / 100); // 15/ 100 means 15% of the current contract balance
        payable(PayeeWallet5).transfer(_balance * 15 / 100); // 15/ 100 means 15% of the current contract balance
        payable(PayeeWallet6).transfer(_balance * 15 / 100); // 15/ 100 means 15% of the current contract balance
         (bool os, ) = payable(owner()).call{value: address(this).balance}(""); // sends any remaining % left to the owner 
        require(os);
  }
  
  }
