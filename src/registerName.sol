/// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title A title that should describe the contract/interface
/// @author The name of the author
/// @notice Explain to an end user what this does
/// @dev Explain to a developer any extra details

contract PNSRegistry{

    mapping(address => string) registryNames;

    event RegisterName(address account, string );

    /// @author The name of the author
    /// @notice Explain to an end user what this does
    /// @dev Explain to a developer any extra details
    constructor(){}

    function register(address account, string memory _registeredName) public view returns (bool){}
    function verify(address account, string memory _registeredName) public view returns(bool){}
    function transfer(address account, string memory _registeredName) public view returns(bool){}
    function renew(address account, string memory _registeredName) public view returns(bool){}
    function expire(address account, string memory _registeredName) public view returns(bool){}

}