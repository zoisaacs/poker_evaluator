
#Pulls the value off of each card
class Pokerhand
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
    if values == [14, 5, 4, 3, 2]
      values = [5, 4, 3, 2, 1]
    else
      values
    end
  end
end
