
#Pulls the suit off of each card
class Pokerhand
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
end
