// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title PollingSystem
 * @dev Implements CodeAlpha Blockchain Internship Task 3: Polling System Smart Contract
 */
contract PollingSystem {

    // 1. Structure defining the blueprint of a single Poll
    struct Poll {
        string title;             // The question or topic of the poll
        string[] options;         // Array of text choices (e.g., ["Yes", "No"])
        uint256 endTime;          // Unix timestamp tracking when voting closes
        uint256[] voteCounts;     // Keeps track of the number of votes each option receives
        bool exists;              // Helper flag to verify if the poll exists
    }

    // State Variables
    uint256 public pollCount;
    
    // Maps unique poll ID to its Poll data structure
    mapping(uint256 => Poll) private polls;
    
    // Nested mapping to ensure an address can only vote once per poll
    // pollId => voterAddress => hasVoted (true/false)
    mapping(uint256 => mapping(address => bool)) private hasVoted;

    // Events for dashboard logging
    event PollCreated(uint256 indexed pollId, string title, uint256 endTime);
    event VoteCast(uint256 indexed pollId, address indexed voter, uint256 optionIndex);

    /**
     * @notice Creates a brand new poll
     * @param _title The core question being asked
     * @param _options An array of text options representing choices
     * @param _durationSeconds How long the poll should remain open in seconds
     */
    function createPoll(
        string calldata _title, 
        string[] calldata _options, 
        uint256 _durationSeconds
    ) external {
        require(_options.length >= 2, "A poll must have at least 2 options");
        require(_durationSeconds > 0, "Duration must be greater than 0 seconds");

        pollCount++;
        
        // Initialize an empty vote counter array matching the options size
        uint256[] memory initialVotes = new uint256[](_options.length);

        polls[pollCount] = Poll({
            title: _title,
            options: _options,
            endTime: block.timestamp + _durationSeconds, // Sets absolute expiration point
            voteCounts: initialVotes,
            exists: true
        });

        emit PollCreated(pollCount, _title, block.timestamp + _durationSeconds);
    }

    /**
     * @notice Casts a single vote for a chosen option index
     * @param _pollId The ID of the target poll
     * @param _optionIndex The array position index of your chosen answer (0 for 1st choice, 1 for 2nd...)
     */
    function castVote(uint256 _pollId, uint256 _optionIndex) external {
        Poll storage poll = polls[_pollId];
        
        // Strict Validation Rule Checks
        require(poll.exists, "This poll does not exist");
        require(block.timestamp < poll.endTime, "Voting has ended for this poll"); // Time restriction
        require(!hasVoted[_pollId][msg.sender], "You have already voted in this poll"); // Prevents double voting
        require(_optionIndex < poll.options.length, "Invalid option selection index");

        // Mark voter as participated and increment the vote counter
        hasVoted[_pollId][msg.sender] = true;
        poll.voteCounts[_optionIndex]++;

        emit VoteCast(_pollId, msg.sender, _optionIndex);
    }

    /**
     * @notice Determines and returns the textual name string of the winning choice
     * @param _pollId The ID of the concluded poll
     */
    function getWinner(uint256 _pollId) external view returns (string memory winningOptionName) {
        Poll storage poll = polls[_pollId];
        
        require(poll.exists, "This poll does not exist");
        require(block.timestamp >= poll.endTime, "Cannot view winner until the poll officially ends"); // Deadline check

        uint256 highestVoteCount = 0;
        uint256 winningIndex = 0;

        // Loop array values to find the choice with the maximum votes
        for (uint256 i = 0; i < poll.voteCounts.length; i++) {
            if (poll.voteCounts[i] > highestVoteCount) {
                highestVoteCount = poll.voteCounts[i];
                winningIndex = i;
            }
        }

        winningOptionName = poll.options[winningIndex];
    }

    /**
     * @notice Utility read-only function to fetch active metrics of a poll
     */
    function getPollDetails(uint256 _pollId) external view returns (
        string memory title, 
        string[] memory options, 
        uint256 endTime, 
        uint256[] memory voteCounts
    ) {
        Poll storage poll = polls[_pollId];
        require(poll.exists, "Poll does not exist");
        return (poll.title, poll.options, poll.endTime, poll.voteCounts);
    }
}