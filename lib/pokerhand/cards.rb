
#The cards in Pokerhand are split up to find the value and suit of each card.
class Pokerhand  
  def processed_cards
    cards.join('').split('')
  end

  load "./pokerhand/cards/values.rb"
  load "./pokerhand/cards/card_suits.rb"
  load "./pokerhand/cards/card_names.rb"
end
