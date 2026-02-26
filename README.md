🛡️ Escrow Smart Contract

A simple Escrow contract in Solidity that enables secure ETH transactions between a buyer and a seller using a state-based workflow.

🔹 How It Works

Buyer deploys the contract and provides the seller’s address.

Buyer deposits ETH into the contract.

After delivery:

Buyer confirms delivery → ETH is transferred to the seller.

OR buyer requests a refund → ETH is returned to the buyer.

🔹 Contract States

Await_Payment

Await_Delivery

Complete

Refunded

🔹 Features

State-controlled transaction flow

Access control using require

Secure ETH transfer using .call()

Prevents invalid state transitions

🔹 Tech Stack

Solidity ^0.8.31

Ethereum (EVM)
