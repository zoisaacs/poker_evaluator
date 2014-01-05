
#Changes cards > 10 to their respective alphabetical names for output
class Pokerhand
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
end
