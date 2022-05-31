// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v4.6.0) (token/ERC20/IERC20.sol)

pragma solidity ^0.8.0;

import "./Ownable.sol";
import "./PaymentSplitter.sol";

contract TEST is Ownable, PaymentSplitter {

    address[] private _team = [
        0x7482885D3708509F65C050C906d608F31A36B9D4,
        0x82C3ACBb6cF6b04f52aDad9Bd4f3D26BC5Db5b36
    ];
    
    uint256[] private _teamShares = [
        10,
        90
    ];

    constructor() PaymentSplitter(_team, _teamShares) {

    }

    function viewDue(address account, uint256 totalReceived, uint256 alreadyReleased) external view returns(uint256) {
        uint256 due = _pendingPayment(account, totalReceived, alreadyReleased);
        return due;
    }

    function addMember(address _addr, uint256 _shares) external onlyOwner {
        _addPayee(_addr, _shares);
    }

    function removeMember(address _addr) external onlyOwner {
        _removePayee(_addr);
    }

    function viewMembers() external view returns(address[] memory) {
        address[] memory members = _viewMembers();
        return members;
    }

}
