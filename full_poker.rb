
#Pokerhand generates the ranking and classification of five-card poker hands and allows them to be sorted based on their ranks. The cards in Pokerhand are always a five-card array.
class Pokerhand
  include Comparable
  attr_accessor :cards, :ranking

  def initialize (cards)
    @cards = cards
    @ranking = ranking

    #####  CARDS  #####
    #The cards in Pokerhand are split up to find the value and suit of each card.

    def processed_cards
      unless cards.uniq.length == 5
        abort("A Pokerhand must be an array with five unique cards")
      end      
      cards.join('').split('')
    end

    #Pulls the value off of each card
    def values
      values = Array.new
      possible_values = %w(nil nil 2 3 4 5 6 7 8 9 T J Q K A)
      processed_cards.each do |z|
        15.times do |i|
          if possible_values.at(i) == z
            values.push i
          end
        end
      end
      values = values.sort.reverse
      if values == [14, 5, 4, 3, 2]   #What if an Ace needs to be a 1?
        values = [5, 4, 3, 2, 1]
      else
        values
      end
    end

    #Changes cards > 10 to their respective alphabetical names for output
    def card_names(system)
      system.map! {|royal|
        if (royal == 11)
          "Jack"
        elsif (royal == 12)
          "Queen"
        elsif (royal == 13)
          "King"
        elsif (royal == 14)
          "Ace"
        else
          royal          
        end
      }
    end

    def best_card
      card_names(values)[0]
    end

    #Pulls the suit off of each card
    def card_suits
      card_suits = Array.new
      suits = %w{C D H S}
      processed_cards.each do |i|
        suits.each do |z|
          if i == z
            card_suits.push i
          end
        end
      end
      card_suits
    end    

    #####  RANKING  #####
    #Once the value and suit of the five cards are determined, Pokerhand ranks the whole hand as an array. This array is compared against the array from other Pokerhands to rank the hands.

    #ranking is the internal array used to rank and sort different Pokerhands
    def ranking
      [what_rank, tie_breaker, values]
    end

    #The first element of ranking
    def what_rank
      10 - all_ranks.find_index{ |truth| truth != 2014} 
    end

    #The second element of ranking
    def tie_breaker
      all_ranks.find{|truth| truth != 2014}
    end

    #ranking is established by the first method in the all_ranks array that doesn't return 2014
    def all_ranks
      [ 
        royal_flush,
        straight_flush,
        four_of_a_kind,
        full_house,
        flush,
        straight,
        three_of_a_kind,
        two_pairs,
        two_of_a_kind,
        high_card
      ]
    end
    
   #All straight and/or flush hands use criteria 
   def criteria(start, length)
      crit = [
        (values.max - values.min == 4),
        (values.uniq.length == 5),
        (card_suits.uniq.length == 1),
        (values[0] == 14)
      ]
      crit[start, length] == Array.new(length, true)
    end
    
    def royal_flush
      if criteria(0,4)
        return values[0]
      else
        return 2014
      end
    end

    def straight_flush
      if criteria(0,3)
        return values[0]
      else
        return 2014
      end
    end

    def straight
      if criteria(0,2)
        return values[0]
      else 
        return 2014
      end
    end

    def flush
      if criteria(2,1)
        return values
      else 
        return 2014
      end
    end

    #Used by all hands with two, three, and/or four of a kind to find the value of the duplicated cards
    def of_a_kind(duplicates)
      values.each do |i|
        if values.count(i) == duplicates
          return i
        end
      end
      return 2014
    end

    def full_house
      if three_of_a_kind && two_of_a_kind != 2014
        return three_of_a_kind
      else
        return 2014
      end
    end

    def two_of_a_kind
      of_a_kind(2)
    end

    def three_of_a_kind
      of_a_kind(3)
    end

    def four_of_a_kind
       of_a_kind(4)
    end

    def two_pairs
      high_pair = two_of_a_kind
      low_pair = low_two_of_a_kind
      if high_pair && low_pair && (high_pair != low_pair)
        return [high_pair, low_pair]
      else
        return 2014
      end
    end

    #Finds the lower pair in a Two Pair hand
    def low_two_of_a_kind
       values.reverse.each do |i|
        if values.reverse.count(i) == 2
          return i
        end
      end
      return false
    end

    #If you have a bad hand...
    def high_card
      [1, values, "#{best_card}-#{card_names(values)[1]} High Card"]
    end

    #Description of the hand for presentation
    def hand_description
      [
      "Royal Flush",
      "#{best_card} high Straight Flush",
      "Four of a Kind with #{four_of_a_kind}'s",
      "Full House with #{three_of_a_kind}'s full of #{two_of_a_kind}'s",
      "#{best_card}-#{card_names(values)[1]} high Flush",
      "#{best_card} high Straight",
      "Three of a Kind with #{three_of_a_kind}'s",
      "Two Pair with #{two_pairs[0]}'s over #{two_pairs[1]}'s",
      "Pair of #{of_a_kind(2)}'s",
      "#{best_card}-#{card_names(values)[1]} High Card"
      ]
    end

    def final_rank
      final_rank = "#{cards} is a #{hand_description[10 - what_rank]}\n"
    end
  end
  
  #Sorts Pokerhands based on their ratings
  def <=> another_poker_hand
      ranking <=> another_poker_hand.ranking    
  end
end

#####  Pokerhand Evaluator #####

#Sorts all Pokerhands in final presentation format
def poker(hands)
  puts "\n\nRanking:\n"
  poker = hands.sort.reverse.each {|a| print a.final_rank}
end


#Sample Pokerhands
Royalflush = %w{QC KC JC AC TC} 
StraightFive = %w{2C 3D 4H AC 5S}
FourOfAKindNine = %w{9D 9H 9S 9C 7D} 
FullHouseTenOverSeven = %w{TD TC TH 7C 7D} 
TwoPairFiveAndNine = %w{5S 5D 9H 9C 6S} 
StraightA = %w{AS KS JS QS TH}
Ace_TenHigh = %w{AS 2S 3S 4S TC} 
ThreeOfAKindTwo = %w{2H 2D 2S 5D 8D}
FlushK_Q = %w{2H 4H 6H KH QH}
PairNine = %w{9C 9S 8D 5H 7S}
StraightFlushFiveHigh = %w{AD 5D 4D 2D 3D}

d = Pokerhand.new(StraightA)
m = Pokerhand.new(FlushK_Q)
r = Pokerhand.new(TwoPairFiveAndNine)
z = Pokerhand.new(StraightFive)
h = Pokerhand.new(FullHouseTenOverSeven)
w = Pokerhand.new(FourOfAKindNine)
q = Pokerhand.new(Royalflush)
g = Pokerhand.new(Ace_TenHigh)
a = Pokerhand.new(ThreeOfAKindTwo)
n = Pokerhand.new(PairNine)
u = Pokerhand.new(StraightFlushFiveHigh)

#Uncomment the next line to see everything in action
poker([a, r, d, n, z, w, h, g, u, q, m])
