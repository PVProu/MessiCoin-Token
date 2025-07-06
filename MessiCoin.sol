// SPDX-License-Identifier: LGPL-3.0-only

pragma solidity 0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/Pausable.sol";



contract MessiCoin is ERC20, Pausable{
    //Variables
    uint256 public constant MAX_SUPPLY = 100000 * 1e18;
    address private owner;

    mapping(address => bool) public isBlacklist;

    //Modifiers
    modifier onlyOwner() {
        if (msg.sender != owner) revert ("Only owner can operate here");
        _;
    }

    modifier notBlacklisted(){
        require(!isBlacklist[msg.sender], "You are blacklisted");
        _;
    }

    event SetBlackList (address blacklisted, bool isBlacklisted);
    event Balance(address account, uint256 amount);

    //Constructor
    constructor(address presaleWallet, address rewardWallet, address dexWallet, address teamWallet) ERC20 ("MessiCoin", "D10S"){
        uint256 presaleAmount = (MAX_SUPPLY * 10) / 100;      // 10%
        uint256 rewardsAmount = (MAX_SUPPLY * 30) / 100;   // 30%
        uint256 dexAmount = (MAX_SUPPLY * 30) / 100;      // 30%
        uint256 teamAmount = (MAX_SUPPLY * 25) / 100;     //25%
        uint256 ownerAmount = (MAX_SUPPLY * 5) / 100;     //5%
        owner = msg.sender;        

        _mint(owner, ownerAmount);
        _mint(presaleWallet, presaleAmount);
        _mint(rewardWallet, rewardsAmount);
        _mint(dexWallet, dexAmount);
        _mint(teamWallet, teamAmount);
        require(totalSupply() == MAX_SUPPLY, "Total supply mismatch");
    }

    //function
    function setBlackList(address toBlacklist, bool value) external onlyOwner whenNotPaused{
        isBlacklist[toBlacklist] = value;
        emit SetBlackList(toBlacklist, value);
    }

    function pausetransactions() external onlyOwner{
        _pause();
    }

    function unpause() external onlyOwner{
        _unpause();
    } 

    function getBlacklistStatus (address bStatus) public view returns (bool){
        return isBlacklist[bStatus];
    }

    function burnTokens(uint256 burnAmount) public whenNotPaused{
        _burn(msg.sender, burnAmount);
    }

    function safeTransfer(address to, uint256 amount) public notBlacklisted whenNotPaused{   
        require(!isBlacklist[to], "Recipent is blacklisted"); 
        _transfer(msg.sender, to, amount);  
    }      
}
