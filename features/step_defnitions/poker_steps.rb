
begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end 
$:.unshift(File.dirname(__FILE__) + '/../../')
require "poker"

Given /^I have a poker game$/ do
 	@game = Poker.new
end

Given /^the community hand is "(.*?)","(.*?)","(.*?)","(.*?)","(.*?)"$/ do |card1,card2,card3,card4,card5|
  @game.community_hand = [card1,card2,card3,card4,card5]
end

Given /^player (\d+) has "(.*?)","(.*?)"$/ do |player, card1, card2|
  @game.player_hand player,card1,card2
end

Then /^player (\d+) has a winning hand$/ do |player|
  @game.winner.include?(player).should == true
end

Then /^player (\d+) does not have a winning hand$/ do |player|
    @game.winner.include?(player).should == false
end


When /^I find the winning player$/ do
  @game.find_winner
end
