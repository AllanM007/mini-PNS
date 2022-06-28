/// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title mini-PNS
/// @author Allan
/// @notice this is a minimal name registry inspired by ENS built on polygon-mumbai
/// @dev Explain to a developer any extra details

contract PNSRegistry{

    struct nameRegistry{
        address owner;
        bytes32 name;
        uint registeredDate;
        bool active;
    }

    nameRegistry registry;

    mapping(address => nameRegistry) registryNames;
    // mapping(address => mapping(string => uint256)) expiryDate;
    // mapping(string => bool) activeName;

    event RegisterName(address account, bytes32 registeredName, uint256 timestamp);
    event TransferName(address account, bytes32 registeredName , uint256 timestamp);
    event RenewName(address account, bytes32 registeredName , uint256 timestamp);
    event RevokeName(address account, bytes32 registeredName , uint256 timestamp);

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

    function register(address _account, bytes31 _registeredName, uint256 timestamp) public returns (bool){
        registry = nameRegistry(_account, _registeredName, block.timestamp, true);

        emit RegisterName(_account, _registeredName, timestamp);
        return true;
    }

    function verify(bytes32 _registeredName) public view returns(address, uint256, bool){

        if (_registeredName == registry.name) {
            return (registry.owner, registry.registeredDate, registry.active);
        } else {
            return (registry.owner, registry.registeredDate, registry.active);
        }
    }

    function transfer(address account, string memory _registeredName) public returns(bool){}
    function renew(address account, string memory _registeredName) public returns(bool){}
    function expire(address account, string memory _registeredName) public returns(bool){}
    function registryLookup() public returns(bytes32){}

}