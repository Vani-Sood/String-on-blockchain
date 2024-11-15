// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MessageStore {
    // Mapping to store user's messages
    mapping(address => string) private messages;
    
    // Event to log message updates
    event MessageStored(address indexed user, string message);

    // Function to store a message
    function storeMessage(string memory _message) public {
        require(bytes(_message).length <= 100, "Message cannot be longer than 100 characters");
        
        // Store the message for the sender
        messages[msg.sender] = _message;
        
        // Emit an event
        emit MessageStored(msg.sender, _message);
    }

    // Function to retrieve a message (only for the sender)
    function getMessage() public view returns (string memory) {
        return messages[msg.sender];
    }
}
