Poker_Evaluator
====================

Ranks five-card poker hands.

Description
-----------

Poker_Evaluator ranks poker hands passed to class Pokerhand with five-card arrays. This evaluator can sort multiple poker hands based on their rank, as well as give a short description of the hands. Duplicate cards in the same poker hand will raise an error, but different poker hands with duplicate cards may still be compared.


To run the evaluator yourself, uncomment the last line in lib/pokerhand.rb, or make your own in the style shown below.

Example
-------


Here are some new Pokerhand classes that are already loaded by pokerhand.rb:
```
RoyalFlush = %w{QC KC JC AC TC}		
Straight5 = %w{2C 3D 4H AC 5S}		
FourOfAKind9 = %w{9D 9H 9S 9C 7D} 	
FullHouse10Over7 = %w{TD TC TH 7C 7D} 		
TwoPair5And9 = %w{5S 5D 9H 9C 6S} 	
StraightAce = %w{AS KS JS QS TH}	
Ace_10High = %w{AS 2S 3S 4S TC} 	
ThreeOfAKind2 = %w{2H 2D 2S 5D 8D}	
FlushKing_Queen = %w{2H 4H 6H KH QH}	
Pair9 = %w{9C 9S 8D 5H 7S}		
FiveHighStraightFlush = %w{AD 5D 4D 2D 3D}		

d = Pokerhand.new(StraightAce)		
m = Pokerhand.new(FlushKing_Queen)		
r = Pokerhand.new(TwoPair5And9)		
z = Pokerhand.new(Straight5)		
h = Pokerhand.new(FullHouse10Over7)		
w = Pokerhand.new(FourOfAKind9)		
q = Pokerhand.new(RoyalFlush)		
g = Pokerhand.new(Ace_10High)		
a = Pokerhand.new(ThreeOfAKind2)		
n = Pokerhand.new(Pair9)		
u = Pokerhand.new(FiveHighStraightFlush)		

poker([a, r, d, n, z, w, h, g, u, q, m])
```

Executing the pokerhand.rb file then yields
```
:!ruby pokerhand.rb


Ranking:		
["QC", "KC", "JC", "AC", "TC"] is a Royal Flush		
["AD", "5D", "4D", "2D", "3D"] is a 5 high Straight Flush		
["9D", "9H", "9S", "9C", "7D"] is a Four of a Kind with 9's		
["TD", "TC", "TH", "7C", "7D"] is a Full House with 10's full of 7's		
["2H", "4H", "6H", "KH", "QH"] is a King-Queen high Flush		
["AS", "KS", "JS", "QS", "TH"] is a Ace high Straight		
["2C", "3D", "4H", "AC", "5S"] is a 5 high Straight		
["2H", "2D", "2S", "5D", "8D"] is a Three of a Kind with 2's		
["5S", "5D", "9H", "9C", "6S"] is a Two Pair with 9's over 5's		
["9C", "9S", "8D", "5H", "7S"] is a Pair of 9's		
["AS", "2S", "3S", "4S", "TC"] is a Ace-10 High Card		
```


License
-------

Feel free to modify or use this code.
