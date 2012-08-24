class Poker
  attr_accessor :community_hand, :winner
  # def community_hand= comcards
  # puts comcards
  # end
  def player_hand player,card1,card2
    @players [player] = [card1,card2]
  end
  def initialize
    @players= {}
  end
  def high_card cards
    cards.map {|card| card_value card }.max
      #puts card_value card
  end
  def remove_high_card! cards
    cards.delete cards.max_by {|card| card_value card}
  end

  def find_winner
    winning_players = []
    winning_value = nil
    @players.each do |player, cards|
      if winning_players.empty?
         winning_players  << player
         winning_value = high_card cards
      else if (high_card cards) >= winning_value 
        if (high_card cards) > winning_value 
          winning_players = []
        end
         winning_players  << player
         winning_value = high_card cards
      end
        
         
      end
    end

    if winning_players.length > 1 #and @players[1].length > 1
       winning_players = []
       winning_value = nil
       @players.each do |player, cards|
        remove_high_card! cards
      end
      @players.each do |player, cards|
      if winning_players.empty?
         winning_players  << player
         winning_value = high_card cards
      else if (high_card cards) >= winning_value 
        if (high_card cards) > winning_value 
          winning_players = []
        end
         winning_players  << player
         winning_value = high_card cards
      end
        
         
      end
    end
    end
    @winner = winning_players
  end



  def card_value card
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
