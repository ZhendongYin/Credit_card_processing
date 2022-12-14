# CreditCardSystem
A basic credit card system.

## Overview of design decisions

### Directory

> credit_card_system

>> account.rb: Credit card account model, which encapsulated the functions of modifying accounts such as add, charge, and credit.

>> account_map.rb: Based on Hash data structure, used to store all account information. It can use the user name to find the corresponding account.

>> cli.rb: Used to accept and process commands entered by the user. Two modes of commands can be handled: File path mode and STDIN mode.

>> command_precess.rb: Encapsulated with methods provided to the Cli for processing commands and saving the account object to the account map. And if there is an error in modifying the account information, it can use transaction() to roll back the account information. 


## Installation

Run `bin/setup` to install dependencies

## Usage

### File Mode

Run `bin/process` with file path

Example: `bin/process input.txt`

### STDIN Mode
Run `bin/process` takes stdin

Commands 

  `Add name credit_card_number limit`
  
  `Charge name amount`
  
  `Credit name amount`
  
  `exit` To quit and see summary.

## Why use Ruby

I am looking for a Ruby development engineer position. Ruby is my main programming language, I have more than 5 years working experience with this language. Personally,
I like the design philosophy of Ruby and Rails very much, and enjoy the experience of metaprogramming about it.
