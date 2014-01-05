
#Sorts all Pokerhands in final presentation format
def poker(hands)
  puts "\n\nRanking:\n"
  poker = hands.sort.reverse.each {|a| print a.final_rank}
end
