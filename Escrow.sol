// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract Escrow{

    enum State{
        Await_Payment,
        Await_Delivery,
        Complete,
        Refunded
    }

    State public currentstate;
    address public buyer;
    address payable seller;

    constructor(address payable _seller){
        currentstate = State.Await_Payment;
        buyer = msg.sender;
        seller = _seller;
    }

    function deposit() external payable{
        require(msg.sender==buyer , "Only buyer can deposit");
        require(currentstate == State.Await_Payment , "Not correct state");
        require(msg.value>0,"Send Eth");
        currentstate = State.Await_Delivery;
    }

    function confirmDelivery() external payable{
        require(msg.sender==buyer,"Only buyer");
        require(currentstate==State.Await_Delivery,"Not Correct State");

        currentstate = State.Complete;
        (bool success, ) = seller.call{value:address(this).balance}("");
        require(success,"Transfer failed");
    }

    function refund() external payable{
        require(msg.sender==buyer,"Only buyer");
        require(currentstate==State.Await_Delivery,"Wrong state");
        currentstate = State.Refunded;
        (bool success,) = buyer.call{value:address(this).balance}("");
        require(success,"Refund failed");
    }
}