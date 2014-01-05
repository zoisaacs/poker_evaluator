
#Description of the hand for presentation
class Pokerhand 
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
end
