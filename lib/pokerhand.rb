
#Pokerhand generates the ranking and classification of five-card poker hands and allows them to be sorted based on their ranks. The cards in Pokerhand are always a five-card array.
class Pokerhand
  include Comparable
  attr_accessor :cards, :ranking

  def initialize (cards)
    @cards = cards
    @ranking = ranking

    load "./pokerhand/cards.rb"
    load "./pokerhand/ranking.rb"
  end
  
  def <=> another_poker_hand
      ranking <=> another_poker_hand.ranking      
  end
end

#Uncomment the next line to see everything in action
#load "./pokerhand/ranking/test_hands.rb"
