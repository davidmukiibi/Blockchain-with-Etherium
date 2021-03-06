pragma solidity ^0.4.21;

contract MyToken {
    
    /* event */
    event Transfer(address indexed from, address indexed to, uint256 value);
    
    /* This creates an array with all balances */
    mapping (address => uint256) public balanceOf;
    
    /* contract metadata */
    string public name;
    string public symbol;
    uint8 public decimals;
    
    /* Initializes contract with initial supply tokens to the creator of the contract */
    function MyToken(uint256 initialSupply, string tokenName, string tokenSymbol, uint8 decimalUnits) public {
        balanceOf[msg.sender] = initialSupply;              // Give the creator all initial tokens
        name = tokenName;                                   // Set the name for display purposes
        symbol = tokenSymbol;                               // Set the symbol for display purposes
        decimals = decimalUnits;                            // Amount of decimals for display purposes
    }
    
    /* Send coins */
    function transfer(address _to, uint256 _value) public {
        
        /* Notify anyone listening that this transfer took place */
        emit Transfer(msg.sender, _to, _value);
        
        /* Check if sender has balance and for overflows */
        require(balanceOf[msg.sender] >= _value && balanceOf[_to] + _value >= balanceOf[_to]);

        /* Add and subtract new balances */
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        
        
    }
}