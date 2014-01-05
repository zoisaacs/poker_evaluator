
#ranking is established by the first method in the all_ranks array that doesn't return 2014
class Pokerhand
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
end
