/// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title mini-PNS
/// @author Allan
/// @notice this is a minimal name registry inspired by ENS built on polygon-mumbai
/// @dev Explain to a developer any extra details

contract PNSRegistry{

    mapping(address => string) registryNames;
    mapping(address => mapping(string => uint256)) expiryDate;
    mapping(string => bool) activeName;

    event RegisterName(address account, string registeredName, uint256 datetimestamp);
    event TransferName(address account, string registeredName , uint256 datetimestamp);
    event RenewName(address account, string registeredName , uint256 datetimestamp);
    event RevokeName(address account, string registeredName , uint256 datetimestamp);

    /// @notice Thrown when trying to update a name you don't own
	error Unauthorized();

    /// @notice Thrown when trying to renew a name past due date
	error PastValidityPeriod();

	/// @notice Thrown when trying to register a name that's already taken
	error AlreadyRegistered();

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