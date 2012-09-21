class Poker
  attr_accessor :community_hand, :winner,:players
  # def community_hand= comcards
  #   puts comcards
  # end
  def player_hand player,card1,card2
    playerobj = Player.new
    playerobj.cards = [card1,card2]
    @players [player] = playerobj
  end

  def initialize
    @players= {}
    @community_hand = []
  end


  def find_winner
    winning_players = []
    winning_value = nil
    @players.each_value do |player|
      player.cards+=@community_hand
      winning_players << player
    end

  #start with most valuable and work down
  
  if winning_players.count > 1 and winning_players.first.cards.count > 2
    best_pair = nil
    best = []
    winning_players.each do |player|
      if player.pair
        if best_pair.nil? or player.pair > best_pair
          best_pair = player.pair!
          best = [player]
        elsif player.pair == best_pair
          best << player
          player.pair!
        end
      end
    end

    if best.any?
      winning_players = best
    end
  end

  #one pair

  if winning_players.count > 1 and winning_players.first.cards.count > 2
    best_pair = nil
    best = []
    winning_players.each do |player|
      if player.pair
        if best_pair.nil? or player.pair > best_pair
          best_pair = player.pair!
          best = [player]
        elsif player.pair == best_pair
          best << player
          player.pair!
        end
      end
    end

    if best.any?
      winning_players = best
    end
  end


  while winning_players.count > 1 and winning_players.first.cards.count > 2
    best = []
    best_card = nil
    winning_players.each do |player|

      if best_card.nil? or player.high_card > best_card
        best = [player]
        best_card = player.high_card!
      elsif player.high_card == best_card
        best << player
        player.high_card!
      end
    end
    winning_players = best
  end



  winning_players.each{|player| player.winner = true}
  end

  def self.card_value card
    value = card.scan(/^[AKQJ]|\d*/)[0]
    if(value == 'A')
      return 13 + 1
    end
    if(value == "K")
      return 12 + 1
    end
    if(value == "Q")
      return 11 + 1
    end
    if(value == :J)
      return 11
    end

    return value.to_i
  end

end

class Player
  attr_accessor :cards,:winner

  def initialize
    @winner = false
  end

def high_card #needs to be cards not used in any other pairing, etc! so we remove as we go
  highest_card = cards.max_by{|card| Poker.card_value card }
  return Poker.card_value highest_card
end

def high_card! #needs to be cards not used in any other pairing, etc! so we remove as we go
  card = high_card
  remove_card_value card
  return card
end

#highest pair!
def pair
  cards.map{|x|Poker.card_value x}.group_by{|i| i}.select{|k,i| i.count >= 2} .keys.max
end

def pair!
  hpair = pair
  remove_card_value hpair
  return hpair
end

def remove_card_value value
  cards.delete_if{|card|(Poker.card_value card) == value}
end


end

class Array
  def mode
    group_by{|i| i}.max{|x,y| x[1].length <=> y[1].length}[0]
  end
end