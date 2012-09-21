# language: en
Feature: poker kata
  compare texas hold em poker hands and determine a winning hand

Scenario: Hands have only high card
  Given I have a poker game
  And the community hand is "1C","4C","6C","7C","9C"
  And player 1 has "2C","8H"
  And player 2 has "3C","QH"
  When I find the winning player
  Then player 2 has a winning hand

Scenario: Hands have only high card
  Given I have a poker game
  And the community hand is "1C","3C","4C","7C","6C"
  And player 1 has "2C","8H"
  And player 2 has "10C","2H"
  When I find the winning player
  Then player 2 has a winning hand
  Then player 1 does not have a winning hand
  
Scenario: Hands have only high card but the highest is EQUALLLLL!!!
  Given I have a poker game
  And player 1 has "AC","8H"
  And player 2 has "AC","2H"
  And player 3 has "AC","9H"
  And the community hand is "1C","3C","4C","6C","7C"
  When I find the winning player
  Then player 3 has a winning hand
  Then player 2 does not have a winning hand
  Then player 1 does not have a winning hand

Scenario: Community Win
  Given I have a poker game
  And player 1 has "1C","2H"
  And player 2 has "1S","3C"
  And player 3 has "4S","2D"
  And the community hand is "5C","7S","8D","9H","AS"
  When I find the winning player
  Then player 1 has a winning hand
  Then player 2 has a winning hand
  Then player 3 has a winning hand

Scenario: Pairs
  Given I have a poker game
  And player 1 has "1C","2H"
  And player 2 has "1S","3C"
  And player 3 has "4S","2D"
  And the community hand is "1C","7S","8D","9H","AS"
  When I find the winning player
  Then player 1 has a winning hand
  Then player 2 has a winning hand
  Then player 3 does not have a winning hand

