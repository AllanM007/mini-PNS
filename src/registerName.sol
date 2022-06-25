/// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title mini-PNS
/// @author Allan
/// @notice this is a minimal name registry inspired by ENS built on polygon-mumbai
/// @dev Explain to a developer any extra details

contract PNSRegistry{

    mapping(address => string) registryNames;

    event RegisterName(address account, string registeredName, uint256 datetimestamp);
    event TransferName(address account, string registeredName , uint256 datetimestamp);
    event RenewName(address account, string registeredName , uint256 datetimestamp);
    event RevokeName(address account, string registeredName , uint256 datetimestamp);

    /// @author Allan
    /// @notice Explain to an end user what this does
    /// @dev Explain to a developer any extra details
    constructor(){}

    function register(address account, string memory _registeredName) public view returns (bool){}
    function verify(address account, string memory _registeredName) public view returns(bool){}
    function transfer(address account, string memory _registeredName) public view returns(bool){}
    function renew(address account, string memory _registeredName) public view returns(bool){}
    function expire(address account, string memory _registeredName) public view returns(bool){}

}