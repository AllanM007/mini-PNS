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
        uint updateDate;
        bool active;
    }

    nameRegistry registry;

    mapping(address => nameRegistry) registryNames;
    // mapping(bytes32 => address) public 

    event RegisterName(address account, bytes32 registeredName, uint256 timestamp);
    event TransferName(address account, address recipient, bytes32 registeredName , uint256 timestamp);
    event RenewName(address account, bytes32 registeredName , uint256 timestamp);
    event RevokeName(address account, bytes32 registeredName , uint256 timestamp);

    /// @notice Thrown when trying to update a name you don't own
	// error Unauthorized();

    /// @notice Thrown when trying to renew a name past due date
	// error PastValidityPeriod();

	/// @notice Thrown when trying to register a name that's already taken
	// error AlreadyRegistered();

    /// @author Allan
    /// @notice Explain to an end user what this does
    /// @dev Explain to a developer any extra details
    constructor(){}

    function register(address _account, bytes32 _registeredName, uint256 timestamp) public returns (bool){

        if (_registeredName == registry.name) {
            return false;            
        } else {
            registry = nameRegistry(_account, _registeredName, block.timestamp, block.timestamp, true);
            
            emit RegisterName(_account, _registeredName, timestamp);
            return true;
        }
    }

    function nameLookup(bytes32 _registeredName) public view returns(address, uint256, bool){

        if (_registeredName == registry.name) {
            return (registry.owner, registry.registeredDate, registry.active);
        } else {
            return (registry.owner, registry.registeredDate, registry.active);
        }
    }

    function transfer(address account, address recipient, bytes32 _registeredName) public returns(bool){
        if (_registeredName == registry.name && account == registry.owner) {
            require(account == registry.owner, "Unauthorized party cannot transfer");
            registry.owner = recipient;
            // uint currentTimestamp = block.timestamp;
            registry.updateDate = block.timestamp;

            emit TransferName(account, recipient, _registeredName , block.timestamp);

            return true;
        } else {
            return false;
        }
    }
    function renew(address account, bytes32 _registeredName) public returns(bool){
        if (_registeredName == registry.name) {
            require(account == registry.owner, "Unauthorized party cannot renew");
            registry.updateDate = block.timestamp;

            emit RenewName(account, _registeredName , block.timestamp);

            return true;   
        } else {
            return false;
        }
    }
    function revoke(bytes32 _registeredName) public returns(bool){
        if (_registeredName == registry.name) {
            registry.active = false;
            // address owner = registry.owner;
            // uint currentTimestamp = block.timestamp;
            registry.updateDate = block.timestamp;

            emit RevokeName(registry.owner, _registeredName , block.timestamp);
            
            return true;   
        } else {
            return false;
        }
    }
    function addressLookup(address _account) public view returns(bytes32){
        // return registry;
        if (_account == registry.owner) {
            return registry.name;            
        } else {
            return bytes32("No address found");
        }
    }

}