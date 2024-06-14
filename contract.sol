// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract MyToken {
    // Public variables here
    string public name;
    string public abbreviation;
    uint public totalSupply;

    // Mapping variable here
    mapping(address => uint) public addressBalances;

    // Constructor to initialize the token details
    constructor(string memory _name, string memory _abbreviation, uint _initialSupply) {
        name = _name;
        abbreviation = _abbreviation;
        totalSupply = _initialSupply;
    }

    // Mint function
    function mint(address sender, uint value) external {
        totalSupply += value;
        addressBalances[sender] += value;
    }

    // Burn function
    function burn(address sender, uint value) external {
        require(addressBalances[sender] >= value, "Insufficient balance to burn");
        totalSupply -= value;
        addressBalances[sender] -= value;
    }
}
