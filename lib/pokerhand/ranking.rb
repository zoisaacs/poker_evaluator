
#Once the value and suit of the five cards are determined, Pokerhand ranks the whole hand as an array. This array is compared against the array from other Pokerhands to rank the hands.
class Pokerhand
  load "./pokerhand/ranking/hand_description.rb"
  load "./pokerhand/ranking/poker.rb"
  load "./pokerhand/ranking/all_ranks.rb"  

  #ranking is the internal array used to rank and sort different Pokerhands
  def ranking
    [what_rank, tie_breaker]
  end

  #The first element of ranking
  def what_rank
    10 - all_ranks.find_index{ |truth| truth != 2014} 
  end

  #The second element of ranking
  def tie_breaker
    all_ranks.find{|truth| truth != 2014}
  end
    
  def best_card
    card_names(values)[0]
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

  #Used by all hands with two, three, and/or four of a kind to find the value of the duplicated cards
  def of_a_kind(duplicates)
    values.each do |i|
      if values.count(i) == duplicates
        return i
      end
    end
    return 2014
  end

  def final_rank
    final_rank = "#{cards} is a #{hand_description[10 - what_rank]}\n"
  end
end
