# language: en
Feature: poker kata
  compare texas hold em poker hands and determine a winning hand

Scenario: Hands have only high card
  Given I have a poker game
  And player 1 has "2C","8H"
  And player 2 has "3C","QH"
  When I find the winning player
  Then player 2 has a winning hand

Scenario: Hands have only high card
  Given I have a poker game
  And player 1 has "2C","8H"
  And player 2 has "10C","2H"
  When I find the winning player
  Then player 2 has a winning hand
  Then player 1 does not have a winning hand
  
Scenario: Hands have only high card but the highest is EQUALLLLL!!!
  Given I have a poker game
  And player 1 has "10C","8H"
  And player 2 has "10C","2H"
  And player 3 has "10C","9H"
  When I find the winning player
  Then player 3 has a winning hand
  Then player 2 does not have a winning hand
  Then player 1 does not have a winning hand

Scenario: Hands have only high card but the highest is EQUALLLLL!!!
  Given I have a poker game
  And player 1 has "10C","8H", "9C"
  And player 2 has "10C","2H", "5D"
  And player 3 has "10C","9H", "6D"
  When I find the winning player
  Then player 1 has a winning hand
  Then player 2 does not have a winning hand
  Then player 3 does not have a winning hand